//
//  News.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/10/27.
//

import Foundation

struct News {
    let title: String?
    let category: String?
}

//TODO: - 더미 데이터, 나중에 지우겠습니다.
var yomojomoViewDummyData: [News] = [
    News(title: "1인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", category: "경제"),
    News(title: "2인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", category: "과학"),
    News(title: "2인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", category: "문화"),
    News(title: "2인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", category: "시사"),
    News(title: "1인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", category: "경제"),
    News(title: "2인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", category: "과학"),
    News(title: "2인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", category: "문화"),
    News(title: "2인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", category: "시사"),
    News(title: "1인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", category: "경제"),
    News(title: "2인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", category: "과학"),
    News(title: "2인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", category: "문화"),
    News(title: "2인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", category: "시사"),
    News(title: "1인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", category: "경제"),
    News(title: "2인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", category: "시사"),
    News(title: "2인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", category: "문화"),
    News(title: "2인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", category: "과학"),
    News(title: "1인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", category: "시사"),
    News(title: "2인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", category: "경제"),
    News(title: "2인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", category: "문화"),
    News(title: "2인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", category: "시사"),
    News(title: "1인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", category: "경제"),
    News(title: "2인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", category: "과학"),
    News(title: "2인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", category: "문화"),
    News(title: "2인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", category: "시사"),
    News(title: "1인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", category: "경제"),
    News(title: "2인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", category: "과학"),
    News(title: "2인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", category: "시사"),
    News(title: "2인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", category: "시사"),
    News(title: "1급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", category: "경제"),
    News(title: "1급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", category: "과학"),
    News(title: "1급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", category: "문화"),
    News(title: "1급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", category: "시사"),
    News(title: "1급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", category: "경제"),
    News(title: "1급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", category: "문화"),
    News(title: "1급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", category: "시사"),
    News(title: "1급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", category: "시사"),
    News(title: "1급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", category: "과학"),
    News(title: "1급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", category: "문화"),
    News(title: "1급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", category: "시사"),
    News(title: "1급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", category: "경제"),
    News(title: "1급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", category: "문화"),
    News(title: "1급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", category: "시사"),
    News(title: "1급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", category: "시사"),
]
