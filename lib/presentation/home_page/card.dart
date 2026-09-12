part of 'home_page.dart';

typedef OnLikeCallback = void Function(String title, bool isLiked);
typedef OnTapCallback = void Function(CardData data);

class _Card extends StatefulWidget {
  final CardData data;
  final OnLikeCallback? onLike;
  final OnTapCallback? onTap;

  const _Card({
    required this.data,
    this.onLike,
    this.onTap,
  });

  @override
  State<_Card> createState() => _CardState();
}

class _CardState extends State<_Card> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    final data = widget.data;

    return GestureDetector(
      onTap: () => widget.onTap?.call(data),
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                child: SizedBox(
                  width: 120,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        data.imageUrl ?? '',
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const Placeholder(),
                      ),
                      Positioned(
                        left: 0,
                        bottom: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          color: Colors.yellow,
                          child: const Text(
                            'скидка 15%',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.text,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text(
                        data.descriptionText,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isLiked = !isLiked;
                            });
                            widget.onLike?.call(data.text, isLiked);
                          },
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: isLiked
                                ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              key: ValueKey(0),
                            )
                                : const Icon(
                              Icons.favorite_border,
                              key: ValueKey(1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}