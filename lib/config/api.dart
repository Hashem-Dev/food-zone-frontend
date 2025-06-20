import 'package:food_zone/main.dart';

// const baseUrl = 'http://localhost:5000/api/v1';

const baseUrl = 'https://food-zone-backend-jet.vercel.app/api/v1';
const clientID =
    '131262046011-kobgetvi7os2ta6rf7j0fpq7kmfvacf0.apps.googleusercontent.com';

final Map<String, String> headers = {
  'Content-Type': 'application/json',
  'Accept-Language': prefs.userLanguage,
};

const cloudinaryName = 'du8zm2nvv';
const cloudinaryApiKey = '637893388429538';
const cloudinaryApiSecret = '7wHM4yiwoxEdT86H0U-Q_0cATZw';
const cloudinaryUploadPreset = "food_zone_flutter";
const cloudinaryUrl =
    "https://api.cloudinary.com/v1_1/$cloudinaryName/image/upload";
