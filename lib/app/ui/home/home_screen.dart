import 'index.dart';

class HomeScreen extends StatefulWidget {
  static const String id = '/HomeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with BaseMixin {
  ScrollController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()..addListener(_scrollListener);
  }

  //List scroll listener
  void _scrollListener() {
    if (_controller?.position.pixels == _controller?.position.maxScrollExtent) {
      context.read<HomeBloc>().add(const GetTournaments());
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return WillPopScope(
        onWillPop: () {
          return onWillPop(context);
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                showMenuDialog(context: context);
              },
            ),
            title: TextWidget(
              text: AppStrings.flyingwolf,
              textSize: SizeConfig.font_18,
              color: AppColors.colorBlack,
              fontWeight: FontStyles.bold,
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.size_16),
            child: SingleChildScrollView(
              controller: _controller,
              child: Column(
                children: [
                  _getUserDetails(context),
                  SizedBox(height: SizeConfig.size_20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextWidget(
                      text: Localization.of(context)?.recommendedForYou,
                      textSize: SizeConfig.font_18,
                      color: AppColors.colorBlack,
                      fontWeight: FontStyles.semiBold,
                    ),
                  ),
                  SizedBox(height: SizeConfig.size_20),
                  BlocBuilder<HomeBloc, HomeState>(
                      buildWhen: (previous, current) =>
                          previous.tournamentRes != current.tournamentRes,
                      builder: (context, state) {
                        return state.tournaments != null
                            ? ListView.separated(
                                itemCount: state.tournaments!.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return LisRow(
                                      action: () {},
                                      tournament: state.tournaments![index]);
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        SizedBox(height: SizeConfig.size_10),
                              )
                            : const SizedBox();
                      }),
                  //_getPageLoader :------------------------------------------------------------
                  _getPageLoader()
                ],
              ),
            ),
          ),
        ));
  }
}

//_getUserDetails :------------------------------------------------------------
Column _getUserDetails(BuildContext context) => Column(children: [
      Container(
          padding: EdgeInsets.all(SizeConfig.size_12),
          color: AppColors.colorWhite,
          child: Row(
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: AppColors.colorGrayLight,
                      borderRadius: BorderRadius.all(
                        Radius.circular(SizeConfig.size_50),
                      )),
                  clipBehavior: Clip.hardEdge,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    height: SizeConfig.size_100,
                    width: SizeConfig.size_100,
                    imageUrl: AppStrings.imageURL,
                  )),
              SizedBox(width: SizeConfig.size_16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: AppStrings.staticName,
                      textSize: SizeConfig.font_20,
                      color: AppColors.colorBlack,
                      fontWeight: FontStyles.bold,
                    ),
                    SizedBox(height: SizeConfig.size_16),
                    BorderedButton(
                        buttonText: "2250",
                        buttonSubText: Localization.of(context)?.eloRating,
                        borderColor: AppColors.colorBorderBlue,
                        textColor: AppColors.colorBorderBlue,
                        subTextColor: AppColors.colorGray,
                        buttonColor: AppColors.colorWhite,
                        minHeight: SizeConfig.size_40,
                        minWidth: SizeConfig.size_200,
                        radius: SizeConfig.size_20,
                        onPressed: () {}),
                  ],
                ),
              ),
            ],
          )),
      SizedBox(
        height: SizeConfig.size_100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(SizeConfig.size_16),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    gradient: _getLinearGradient(AppColors.colorCardYellow),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(SizeConfig.size_20),
                      bottomLeft: Radius.circular(SizeConfig.size_20),
                    )),
                child: _getUserCardItem(
                    value: "34",
                    title: Localization.of(context)?.tournamentsPlayed),
              ),
            ),
            VerticalDivider(
                width: 1, thickness: 1, color: AppColors.colorWhite),
            Expanded(
              flex: 1,
              child: Container(
                  padding: EdgeInsets.all(SizeConfig.size_16),
                  decoration: BoxDecoration(
                      gradient: _getLinearGradient(AppColors.colorCardPurple)),
                  child: _getUserCardItem(
                      value: "09",
                      title: Localization.of(context)?.tournamentsWon)),
            ),
            VerticalDivider(
                width: 1, thickness: 1, color: AppColors.colorWhite),
            Expanded(
              flex: 1,
              child: Container(
                  padding: EdgeInsets.all(SizeConfig.size_16),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      gradient: _getLinearGradient(AppColors.colorCardOrange),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(SizeConfig.size_20),
                        bottomRight: Radius.circular(SizeConfig.size_20),
                      )),
                  child: _getUserCardItem(
                      value: "23%",
                      title: Localization.of(context)?.winningPercentage)),
            ),
          ],
        ),
      ),
    ]);

//_getUserCardItem :------------------------------------------------------------
Column _getUserCardItem({required String? value, required String? title}) =>
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextWidget(
          text: value,
          textSize: SizeConfig.font_18,
          color: AppColors.colorWhite,
          textAlign: TextAlign.center,
          fontWeight: FontStyles.semiBold,
        ),
        TextWidget(
          text: title,
          textSize: SizeConfig.font_12,
          textAlign: TextAlign.center,
          color: AppColors.colorWhite,
          fontWeight: FontStyles.semiBold,
        )
      ],
    );

//_getLinearGradient: ------------------------------------------------------------
LinearGradient _getLinearGradient(Color colorCard) => LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      stops: const [0.1, 0.5, 0.7, 0.9],
      colors: [
        colorCard.withOpacity(0.6),
        colorCard.withOpacity(0.8),
        colorCard.withOpacity(0.9),
        colorCard,
      ],
    );

//_getPageLoader :------------------------------------------------------------
SizedBox _getPageLoader() => SizedBox(
      height: SizeConfig.size_40,
      child: BlocBuilder<HomeBloc, HomeState>(
          buildWhen: (previous, current) =>
              previous.apiCallState != current.apiCallState,
          builder: (context, state) {
            return Visibility(
                visible: state.apiCallState == ApiCallState.loading,
                child: const CircularProgressIndicator());
          }),
    );

//LisRow :------------------------------------------------------------
class LisRow extends StatelessWidget {
  const LisRow({Key? key, required this.action, required this.tournament})
      : super(key: key);

  final VoidCallback action;
  final Tournament tournament;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: AppColors.colorWhite,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeConfig.size_15),
        ),
        child: InkWell(
          onTap: action,
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: tournament.coverUrl ?? '',
                fit: BoxFit.contain,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    SizedBox(
                        height: SizeConfig.size_50,
                        width: SizeConfig.size_50,
                        child: Padding(
                          padding: EdgeInsets.all(SizeConfig.size_5),
                          child: CircularProgressIndicator(
                              value: downloadProgress.progress),
                        )),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Padding(
                padding: EdgeInsets.all(SizeConfig.size_16),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: tournament.name,
                            textSize: SizeConfig.font_16,
                            color: AppColors.colorBlack,
                            fontWeight: FontStyles.semiBold,
                          ),
                          TextWidget(
                            text: tournament.gameName,
                            textSize: SizeConfig.font_16,
                            color: AppColors.colorGray,
                            fontWeight: FontStyles.semiBold,
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.colorArrow,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
