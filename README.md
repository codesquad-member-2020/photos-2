
# Photos App
### Members
[delma](https://github.com/delmaSong), [모스](https://github.com/kjoonk)

## Ground Rules

### 매일 할일

- 기능구현
- 예습 위주 공부
- 스크럼

### 매일 스크럼 시 공유할 내용

- 요구사항 분석 및 issue 생성
- 전날 공부한 것 공유
- 다음 날 공부해야 할 키워드 정리

<br>

## 브랜치 관리

- `master`: 온전한 개발 사항이 반영된 브랜치로 dev에서 merge함
- `dev`: PR 보내는 브랜치.
- `feature/****`: 각 기능 담당 브랜치. dev로 PR 보냄.  step별로 PR.
- `feature/****/issue-number`: 각 step 밑에 issue 번호로 브랜치 만들어서 구현

<br>


## Coding Convention

- [StyleShare/swift-style-guide: StyleShare에서 작성한 Swift 한국어 스타일 가이드](https://github.com/StyleShare/swift-style-guide)
- [[Swift] Naming Convention for Swift - jinshine 기술 블로그 - Medium](https://medium.com/jinshine-%EA%B8%B0%EC%88%A0-%EB%B8%94%EB%A1%9C%EA%B7%B8/naming-convention-for-swift-fe15acf46a46)


<br>

## 진행사항

### Step 1. Collection View
2020.03.16 Mon


**요구 사항**
- 스토리보드 ViewController에 CollectionView를 추가하고 Safe 영역에 가득 채우도록 frame을 설정한다.
- CollectionView Cell 크기를 80 x 80 로 지정한다.
- UICollectionViewDataSource 프로토콜을 채택하고 40개 cell을 랜덤한 색상으로 채우도록 구현한다.

<br>

**실행 화면**
<img src = "https://i.imgur.com/y3ey19t.png" width = "80%"/>


<br>
<br>

### Step 2. Photos 라이브러리
2020.03.17 Tue

<br>

**요구 사항**
- UINavigationController를 Embed시키고, 타이틀을 'Photos'로 지정한다.
- PHAsset 프레임워크를 사용해서 사진보관함에 있는 사진 이미지를 Cell에 표시한다.
    - CollectionView Cell 크기를 100 x 100 로 변경한다.
    - Cell을 처리하기 위한 커스텀 클래스를 만들어서 지정한다.
    - Cell을 가득 채우도록 UIImageView를 추가한다.
- PHCachingImageManager 클래스를 활용해서 썸네일 이미지를 100 x 100 크기로 생성해서 Cell에 표시한다.
- PHPhotoLibrary 클래스에 사진보관함이 변경되는지 여부를 옵저버로 등록한다.

<br>

**실행 화면**

<img src = "https://i.imgur.com/U0xCF3M.png" width = "80%"/>


