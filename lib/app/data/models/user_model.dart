// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        this.uid,
        this.displayName,
        this.email,
        this.photoUrl,
        this.phoneNumber,
        this.emailVerified,
        this.profileStatus,
        this.gender,
        this.dob,
        this.location,
        this.maritalStatus,
        this.studyPrefrences,
        this.experience,
        this.education,
        this.testScore,
        this.additionalInformation,
        this.lorDetails,
    });

    String? uid;
    String? displayName;
    String? email;
    String? photoUrl;
    String? phoneNumber;
    bool? emailVerified;
    int? profileStatus;
    String? gender;
    String? dob;
    String? location;
    String? maritalStatus;
    StudyPrefrences? studyPrefrences;
    Experience? experience;
    Education? education;
    TestScore? testScore;
    AdditionalInformation? additionalInformation;
    LorDetails? lorDetails;

    UserModel copyWith({
        String? uid,
        String? displayName,
        String? email,
        String? photoUrl,
        String? phoneNumber,
        bool? emailVerified,
        int? profileStatus,
        String? gender,
        String? dob,
        String? location,
        String? maritalStatus,
        StudyPrefrences? studyPrefrences,
        Experience? experience,
        Education? education,
        TestScore? testScore,
        AdditionalInformation? additionalInformation,
        LorDetails? lorDetails,
    }) => 
        UserModel(
            uid: uid ?? this.uid,
            displayName: displayName ?? this.displayName,
            email: email ?? this.email,
            photoUrl: photoUrl ?? this.photoUrl,
            phoneNumber: phoneNumber ?? this.phoneNumber,
            emailVerified: emailVerified ?? this.emailVerified,
            profileStatus: profileStatus ?? this.profileStatus,
            gender: gender ?? this.gender,
            dob: dob ?? this.dob,
            location: location ?? this.location,
            maritalStatus: maritalStatus ?? this.maritalStatus,
            studyPrefrences: studyPrefrences ?? this.studyPrefrences,
            experience: experience ?? this.experience,
            education: education ?? this.education,
            testScore: testScore ?? this.testScore,
            additionalInformation: additionalInformation ?? this.additionalInformation,
            lorDetails: lorDetails ?? this.lorDetails,
        );

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json["uid"],
        displayName: json["displayName"],
        email: json["email"],
        photoUrl: json["photoUrl"],
        phoneNumber: json["phoneNumber"],
        emailVerified: json["emailVerified"],
        profileStatus: json["profileStatus"],
        gender: json["gender"],
        dob: json["dob"],
        location: json["location"],
        maritalStatus: json["maritalStatus"],
        studyPrefrences: json["studyPrefrences"] == null ? null : StudyPrefrences.fromJson(json["studyPrefrences"]),
        experience: json["experience"] == null ? null : Experience.fromJson(json["experience"]),
        education: json["education"] == null ? null : Education.fromJson(json["education"]),
        testScore: json["testScore"] == null ? null : TestScore.fromJson(json["testScore"]),
        additionalInformation: json["additionalInformation"] == null ? null : AdditionalInformation.fromJson(json["additionalInformation"]),
        lorDetails: json["LORDetails"] == null ? null : LorDetails.fromJson(json["LORDetails"]),
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "displayName": displayName,
        "email": email,
        "photoUrl": photoUrl,
        "phoneNumber": phoneNumber,
        "emailVerified": emailVerified,
        "profileStatus": profileStatus,
        "gender": gender,
        "dob": dob,
        "location": location,
        "maritalStatus": maritalStatus,
        "studyPrefrences": studyPrefrences?.toJson(),
        "experience": experience?.toJson(),
        "education": education?.toJson(),
        "testScore": testScore?.toJson(),
        "additionalInformation": additionalInformation?.toJson(),
        "LORDetails": lorDetails?.toJson(),
    };
}

class AdditionalInformation {
    AdditionalInformation({
        this.contactName,
        this.contactNumber,
        this.email,
        this.relationshipWithApplicant,
        this.mailingAdress,
        this.permanentAddress,
    });

    String? contactName;
    String? contactNumber;
    String? email;
    String? relationshipWithApplicant;
    String? mailingAdress;
    String? permanentAddress;

    AdditionalInformation copyWith({
        String? contactName,
        String? contactNumber,
        String? email,
        String? relationshipWithApplicant,
        String? mailingAdress,
        String? permanentAddress,
    }) => 
        AdditionalInformation(
            contactName: contactName ?? this.contactName,
            contactNumber: contactNumber ?? this.contactNumber,
            email: email ?? this.email,
            relationshipWithApplicant: relationshipWithApplicant ?? this.relationshipWithApplicant,
            mailingAdress: mailingAdress ?? this.mailingAdress,
            permanentAddress: permanentAddress ?? this.permanentAddress,
        );

    factory AdditionalInformation.fromJson(Map<String, dynamic> json) => AdditionalInformation(
        contactName: json["contactName"],
        contactNumber: json["contactNumber"],
        email: json["email"],
        relationshipWithApplicant: json["relationshipWithApplicant"],
        mailingAdress: json["mailingAdress"],
        permanentAddress: json["permanentAddress"],
    );

    Map<String, dynamic> toJson() => {
        "contactName": contactName,
        "contactNumber": contactNumber,
        "email": email,
        "relationshipWithApplicant": relationshipWithApplicant,
        "mailingAdress": mailingAdress,
        "permanentAddress": permanentAddress,
    };
}

class Education {
    Education({
        this.listOfEducation,
        this.totolYearOfEducation,
        this.totalBacklogs,
    });

    List<ListOfEducation>? listOfEducation;
    int? totolYearOfEducation;
    int? totalBacklogs;

    Education copyWith({
        List<ListOfEducation>? listOfEducation,
        int? totolYearOfEducation,
        int? totalBacklogs,
    }) => 
        Education(
            listOfEducation: listOfEducation ?? this.listOfEducation,
            totolYearOfEducation: totolYearOfEducation ?? this.totolYearOfEducation,
            totalBacklogs: totalBacklogs ?? this.totalBacklogs,
        );

    factory Education.fromJson(Map<String, dynamic> json) => Education(
        listOfEducation: json["listOfEducation"] == null ? [] : List<ListOfEducation>.from(json["listOfEducation"]!.map((x) => ListOfEducation.fromJson(x))),
        totolYearOfEducation: json["totolYearOfEducation"],
        totalBacklogs: json["totalBacklogs"],
    );

    Map<String, dynamic> toJson() => {
        "listOfEducation": listOfEducation == null ? [] : List<dynamic>.from(listOfEducation!.map((x) => x.toJson())),
        "totolYearOfEducation": totolYearOfEducation,
        "totalBacklogs": totalBacklogs,
    };
}

class ListOfEducation {
    ListOfEducation({
        this.level,
        this.cityOfEducation,
        this.stateOfEducation,
        this.countryOfEducation,
        this.courseName,
        this.gradingSystem,
        this.achievedMarks,
        this.languageOfInstruction,
        this.startedData,
        this.endedData,
    });

    String? level;
    String? cityOfEducation;
    String? stateOfEducation;
    String? countryOfEducation;
    String? courseName;
    String? gradingSystem;
    int? achievedMarks;
    String? languageOfInstruction;
    String? startedData;
    String? endedData;

    ListOfEducation copyWith({
        String? level,
        String? cityOfEducation,
        String? stateOfEducation,
        String? countryOfEducation,
        String? courseName,
        String? gradingSystem,
        int? achievedMarks,
        String? languageOfInstruction,
        String? startedData,
        String? endedData,
    }) => 
        ListOfEducation(
            level: level ?? this.level,
            cityOfEducation: cityOfEducation ?? this.cityOfEducation,
            stateOfEducation: stateOfEducation ?? this.stateOfEducation,
            countryOfEducation: countryOfEducation ?? this.countryOfEducation,
            courseName: courseName ?? this.courseName,
            gradingSystem: gradingSystem ?? this.gradingSystem,
            achievedMarks: achievedMarks ?? this.achievedMarks,
            languageOfInstruction: languageOfInstruction ?? this.languageOfInstruction,
            startedData: startedData ?? this.startedData,
            endedData: endedData ?? this.endedData,
        );

    factory ListOfEducation.fromJson(Map<String, dynamic> json) => ListOfEducation(
        level: json["level"],
        cityOfEducation: json["cityOfEducation"],
        stateOfEducation: json["stateOfEducation"],
        countryOfEducation: json["countryOfEducation"],
        courseName: json["courseName"],
        gradingSystem: json["gradingSystem"],
        achievedMarks: json["achievedMarks"],
        languageOfInstruction: json["languageOfInstruction"],
        startedData: json["startedData"],
        endedData: json["endedData"],
    );

    Map<String, dynamic> toJson() => {
        "level": level,
        "cityOfEducation": cityOfEducation,
        "stateOfEducation": stateOfEducation,
        "countryOfEducation": countryOfEducation,
        "courseName": courseName,
        "gradingSystem": gradingSystem,
        "achievedMarks": achievedMarks,
        "languageOfInstruction": languageOfInstruction,
        "startedData": startedData,
        "endedData": endedData,
    };
}

class Experience {
    Experience({
        this.listOfJobs,
        this.totalWorkExperience,
    });

    List<ListOfJob>? listOfJobs;
    int? totalWorkExperience;

    Experience copyWith({
        List<ListOfJob>? listOfJobs,
        int? totalWorkExperience,
    }) => 
        Experience(
            listOfJobs: listOfJobs ?? this.listOfJobs,
            totalWorkExperience: totalWorkExperience ?? this.totalWorkExperience,
        );

    factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        listOfJobs: json["listOfJobs"] == null ? [] : List<ListOfJob>.from(json["listOfJobs"]!.map((x) => ListOfJob.fromJson(x))),
        totalWorkExperience: json["totalWorkExperience"],
    );

    Map<String, dynamic> toJson() => {
        "listOfJobs": listOfJobs == null ? [] : List<dynamic>.from(listOfJobs!.map((x) => x.toJson())),
        "totalWorkExperience": totalWorkExperience,
    };
}

class ListOfJob {
    ListOfJob({
        this.jobRole,
        this.companyName,
        this.jobDescription,
        this.startedData,
        this.endedData,
    });

    String? jobRole;
    String? companyName;
    String? jobDescription;
    String? startedData;
    String? endedData;

    ListOfJob copyWith({
        String? jobRole,
        String? companyName,
        String? jobDescription,
        String? startedData,
        String? endedData,
    }) => 
        ListOfJob(
            jobRole: jobRole ?? this.jobRole,
            companyName: companyName ?? this.companyName,
            jobDescription: jobDescription ?? this.jobDescription,
            startedData: startedData ?? this.startedData,
            endedData: endedData ?? this.endedData,
        );

    factory ListOfJob.fromJson(Map<String, dynamic> json) => ListOfJob(
        jobRole: json["jobRole"],
        companyName: json["companyName"],
        jobDescription: json["jobDescription"],
        startedData: json["startedData"],
        endedData: json["endedData"],
    );

    Map<String, dynamic> toJson() => {
        "jobRole": jobRole,
        "companyName": companyName,
        "jobDescription": jobDescription,
        "startedData": startedData,
        "endedData": endedData,
    };
}

class LorDetails {
    LorDetails({
        this.name,
        this.jobRole,
        this.companyName,
        this.recommededBy,
        this.email,
        this.contactNumber,
        this.relationToStudent,
        this.designation,
        this.postalAddress,
    });

    String? name;
    String? jobRole;
    String? companyName;
    String? recommededBy;
    String? email;
    String? contactNumber;
    String? relationToStudent;
    String? designation;
    String? postalAddress;

    LorDetails copyWith({
        String? name,
        String? jobRole,
        String? companyName,
        String? recommededBy,
        String? email,
        String? contactNumber,
        String? relationToStudent,
        String? designation,
        String? postalAddress,
    }) => 
        LorDetails(
            name: name ?? this.name,
            jobRole: jobRole ?? this.jobRole,
            companyName: companyName ?? this.companyName,
            recommededBy: recommededBy ?? this.recommededBy,
            email: email ?? this.email,
            contactNumber: contactNumber ?? this.contactNumber,
            relationToStudent: relationToStudent ?? this.relationToStudent,
            designation: designation ?? this.designation,
            postalAddress: postalAddress ?? this.postalAddress,
        );

    factory LorDetails.fromJson(Map<String, dynamic> json) => LorDetails(
        name: json["name"],
        jobRole: json["jobRole"],
        companyName: json["companyName"],
        recommededBy: json["recommededBy"],
        email: json["email"],
        contactNumber: json["contactNumber"],
        relationToStudent: json["relationToStudent"],
        designation: json["designation"],
        postalAddress: json["postalAddress"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "jobRole": jobRole,
        "companyName": companyName,
        "recommededBy": recommededBy,
        "email": email,
        "contactNumber": contactNumber,
        "relationToStudent": relationToStudent,
        "designation": designation,
        "postalAddress": postalAddress,
    };
}

class StudyPrefrences {
    StudyPrefrences({
        this.courseLevel,
        this.countryPrefrences,
        this.preferredCourse,
        this.specialization,
        this.inTake,
        this.budget,
    });

    String? courseLevel;
    String? countryPrefrences;
    String? preferredCourse;
    String? specialization;
    String? inTake;
    int? budget;

    StudyPrefrences copyWith({
        String? courseLevel,
        String? countryPrefrences,
        String? preferredCourse,
        String? specialization,
        String? inTake,
        int? budget,
    }) => 
        StudyPrefrences(
            courseLevel: courseLevel ?? this.courseLevel,
            countryPrefrences: countryPrefrences ?? this.countryPrefrences,
            preferredCourse: preferredCourse ?? this.preferredCourse,
            specialization: specialization ?? this.specialization,
            inTake: inTake ?? this.inTake,
            budget: budget ?? this.budget,
        );

    factory StudyPrefrences.fromJson(Map<String, dynamic> json) => StudyPrefrences(
        courseLevel: json["courseLevel"],
        countryPrefrences: json["countryPrefrences"],
        preferredCourse: json["preferredCourse"],
        specialization: json["specialization"],
        inTake: json["inTake"],
        budget: json["budget"],
    );

    Map<String, dynamic> toJson() => {
        "courseLevel": courseLevel,
        "countryPrefrences": countryPrefrences,
        "preferredCourse": preferredCourse,
        "specialization": specialization,
        "inTake": inTake,
        "budget": budget,
    };
}

class TestScore {
    TestScore({
        this.listOfTest,
    });

    List<ListOfTest>? listOfTest;

    TestScore copyWith({
        List<ListOfTest>? listOfTest,
    }) => 
        TestScore(
            listOfTest: listOfTest ?? this.listOfTest,
        );

    factory TestScore.fromJson(Map<String, dynamic> json) => TestScore(
        listOfTest: json["listOfTest"] == null ? [] : List<ListOfTest>.from(json["listOfTest"]!.map((x) => ListOfTest.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "listOfTest": listOfTest == null ? [] : List<dynamic>.from(listOfTest!.map((x) => x.toJson())),
    };
}

class ListOfTest {
    ListOfTest({
        this.testName,
        this.testScore,
        this.date,
    });

    String? testName;
    String? testScore;
    String? date;

    ListOfTest copyWith({
        String? testName,
        String? testScore,
        String? date,
    }) => 
        ListOfTest(
            testName: testName ?? this.testName,
            testScore: testScore ?? this.testScore,
            date: date ?? this.date,
        );

    factory ListOfTest.fromJson(Map<String, dynamic> json) => ListOfTest(
        testName: json["testName"],
        testScore: json["testScore"],
        date: json["date"],
    );

    Map<String, dynamic> toJson() => {
        "testName": testName,
        "testScore": testScore,
        "date": date,
    };
}
