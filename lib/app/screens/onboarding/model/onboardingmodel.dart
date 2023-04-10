class OnboardingModel {
  final String image;
  final String discription;
  final String title;
  final String gifimage;

  OnboardingModel(this.image, this.title, this.discription, this.gifimage);
}

List<OnboardingModel> contents = [
  OnboardingModel(
      'asset/onboarding/onboading2.png',
      'Welcome to Turban Mobility',
      'Get Ready to enjoy the finest public bike share system.',
      'asset/onboarding/onboarding2_1.gif'),
  OnboardingModel(
      'asset/onboarding/onboading2.png',
      'Pick a Vehicle',
      'We at TURBAN MOBILITY LLP are revolutionising mobility in smart cities and campuses by increasing the smart cycle and Electric Vehicles',
      'asset/onboarding/onboading3.gif'),
  OnboardingModel(
      'asset/onboarding/onboading2.png',
      'Pick a Vehicle',
      'TURBAN MOBILITY LLP with it associates is a technology company which has proven its capability by providing smart mobility',
      'asset/onboarding/onboarding4.gif'),
  OnboardingModel(
      'asset/onboarding/onboading2.png',
      'Pick a Vehicle',
      'With our innovative IoT technology, you can pick a Smart Bicycle by unlocking through the app, get wherever you are going, and park at any nearby designated parking station.',
      'asset/onboarding/onboarding5.gif'),
];
