// To parse this JSON data, do
//
//     final courseModel = courseModelFromJson(jsonString);

import 'dart:convert';

CourseModel courseModelFromJson(String str) => CourseModel.fromJson(json.decode(str));

String courseModelToJson(CourseModel data) => json.encode(data.toJson());

class CourseModel {
    CourseModel({
        this.university,
        this.universityDetails,
        this.universityLogo,
        this.category,
        this.subCategory,
        this.programMethod,
        this.location,
        this.courseName,
        this.courseId,
        this.startDate,
        this.images,
        this.programSummary,
        this.programLevel,
        this.programLength,
        this.costOfLiving,
        this.tutionFee,
        this.applicationFee,
        this.minEducationLevel,
        this.admissionRequirement,
    });

    String? university;
    String? universityDetails;
    String? universityLogo;
    String? category;
    String? subCategory;
    List<String>? programMethod;
    String? location;
    String? courseName;
    int? courseId;
    String? startDate;
    List<String>? images;
    String? programSummary;
    List<String>? programLevel;
    int? programLength;
    int? costOfLiving;
    int? tutionFee;
    int? applicationFee;
    String? minEducationLevel;
    AdmissionRequirement? admissionRequirement;

    CourseModel copyWith({
        String? university,
        String? universityDetails,
        String? universityLogo,
        String? category,
        String? subCategory,
        List<String>? programMethod,
        String? location,
        String? courseName,
        int? courseId,
        String? startDate,
        List<String>? images,
        String? programSummary,
        List<String>? programLevel,
        int? programLength,
        int? costOfLiving,
        int? tutionFee,
        int? applicationFee,
        String? minEducationLevel,
        AdmissionRequirement? admissionRequirement,
    }) => 
        CourseModel(
            university: university ?? this.university,
            universityDetails: universityDetails ?? this.universityDetails,
            universityLogo: universityLogo ?? this.universityLogo,
            category: category ?? this.category,
            subCategory: subCategory ?? this.subCategory,
            programMethod: programMethod ?? this.programMethod,
            location: location ?? this.location,
            courseName: courseName ?? this.courseName,
            courseId: courseId ?? this.courseId,
            startDate: startDate ?? this.startDate,
            images: images ?? this.images,
            programSummary: programSummary ?? this.programSummary,
            programLevel: programLevel ?? this.programLevel,
            programLength: programLength ?? this.programLength,
            costOfLiving: costOfLiving ?? this.costOfLiving,
            tutionFee: tutionFee ?? this.tutionFee,
            applicationFee: applicationFee ?? this.applicationFee,
            minEducationLevel: minEducationLevel ?? this.minEducationLevel,
            admissionRequirement: admissionRequirement ?? this.admissionRequirement,
        );

    factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        university: json["university"],
        universityDetails: json["universityDetails"],
        universityLogo: json["universityLogo"],
        category: json["category"],
        subCategory: json["subCategory"],
        programMethod: json["programMethod"] == null ? [] : List<String>.from(json["programMethod"]!.map((x) => x)),
        location: json["location"],
        courseName: json["courseName"],
        courseId: json["courseId"],
        startDate: json["start_date"],
        images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
        programSummary: json["programSummary"],
        programLevel: json["programLevel"] == null ? [] : List<String>.from(json["programLevel"]!.map((x) => x)),
        programLength: json["programLength"],
        costOfLiving: json["costOfLiving"],
        tutionFee: json["tution_fee"],
        applicationFee: json["application_fee"],
        minEducationLevel: json["minEducationLevel"],
        admissionRequirement: json["admissionRequirement"] == null ? null : AdmissionRequirement.fromJson(json["admissionRequirement"]),
    );

    Map<String, dynamic> toJson() => {
        "university": university,
        "universityDetails": universityDetails,
        "universityLogo": universityLogo,
        "category": category,
        "subCategory": subCategory,
        "programMethod": programMethod == null ? [] : List<dynamic>.from(programMethod!.map((x) => x)),
        "location": location,
        "courseName": courseName,
        "courseId": courseId,
        "start_date": startDate,
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "programSummary": programSummary,
        "programLevel": programLevel == null ? [] : List<dynamic>.from(programLevel!.map((x) => x)),
        "programLength": programLength,
        "costOfLiving": costOfLiving,
        "tution_fee": tutionFee,
        "application_fee": applicationFee,
        "minEducationLevel": minEducationLevel,
        "admissionRequirement": admissionRequirement?.toJson(),
    };
}

class AdmissionRequirement {
    AdmissionRequirement({
        this.academicsBackgroud,
    });

    AcademicsBackgroud? academicsBackgroud;

    AdmissionRequirement copyWith({
        AcademicsBackgroud? academicsBackgroud,
    }) => 
        AdmissionRequirement(
            academicsBackgroud: academicsBackgroud ?? this.academicsBackgroud,
        );

    factory AdmissionRequirement.fromJson(Map<String, dynamic> json) => AdmissionRequirement(
        academicsBackgroud: json["academicsBackgroud"] == null ? null : AcademicsBackgroud.fromJson(json["academicsBackgroud"]),
    );

    Map<String, dynamic> toJson() => {
        "academicsBackgroud": academicsBackgroud?.toJson(),
    };
}

class AcademicsBackgroud {
    AcademicsBackgroud({
        this.minimumEducation,
        this.minimumGpa,
        this.minimumLts,
    });

    String? minimumEducation;
    String? minimumGpa;
    List<dynamic>? minimumLts;

    AcademicsBackgroud copyWith({
        String? minimumEducation,
        String? minimumGpa,
        List<dynamic>? minimumLts,
    }) => 
        AcademicsBackgroud(
            minimumEducation: minimumEducation ?? this.minimumEducation,
            minimumGpa: minimumGpa ?? this.minimumGpa,
            minimumLts: minimumLts ?? this.minimumLts,
        );

    factory AcademicsBackgroud.fromJson(Map<String, dynamic> json) => AcademicsBackgroud(
        minimumEducation: json["minimumEducation"],
        minimumGpa: json["minimumGPA"],
        minimumLts: json["minimumLTS"] == null ? [] : List<dynamic>.from(json["minimumLTS"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "minimumEducation": minimumEducation,
        "minimumGPA": minimumGpa,
        "minimumLTS": minimumLts == null ? [] : List<dynamic>.from(minimumLts!.map((x) => x)),
    };
}
