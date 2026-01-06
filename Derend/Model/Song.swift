//
//  SongData.swift
//  Derend
//
//  Created by Maria Regina Taufik on 13/05/25.
//

import Foundation

struct Item: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let author: String?
    let description: String?
    let musicSearch: String?
    let imageName: String
    let lyrics: String?
}

struct MockData {
    static let EmptyData = Item(
        title: "Not Found",
        author: nil,
        description: nil,
        musicSearch: nil,
        imageName: "",
        lyrics: nil
    )

    static let MusicData = [
        Item(
            title: "The Golden Years",
            author: "Joshua Bassett",
            description: nil,
            musicSearch: "The Golden Years Joshua Bassett",
            imageName: "The Golden Years",
            lyrics: """
                Time stopped movin' the minute I saw you
                You took my Taylor guitar in the city of stars and you made it your own
                (Stars and you made it your own, stars and you made it your own)
                Late night, oh, how I'm missin' those brown eyes
                Funny, I'd rather be fightin' with you than alone in the city we knew
                (Alone in the city, alone in the city we knew)
                
                Four years gone by in the blink of an eye
                We were young 'til we weren't
                It was fun 'til it hurt
                Now I'm terrified that I'll never find love like yours
                
                If I would've known those were the golden years
                I would've held you longer that night when you kissed me goodbye through your tears
                If I would've known those were the golden years
                I would've never left you alone when you needed me most, my dear
                
                'Cause those were the golden years (woo-ooh-ooh, woo-ooh-ooh)
                Those were the golden years (woo-ooh-ooh, woo-ooh-ooh)
                
                I left you under the cherry tree that June
                Back at the place where I told you that I loved you way too soon
                (Loved you way too soon, loved you way too soon)
                Lately, I stare at the pictures you gave me
                I can't help wonderin' if you ever stare back at them too (stare back at them)
                
                If I would've known those were the golden years
                I would've held you longer that night when you kissed me goodbye through your tears
                If I would've known those were the golden years
                I would've never left you alone when you needed me most, my dear
                
                'Cause those were the golden years
                
                So dance with me under the cherry tree, darlin'
                We'll act like we're still young and free (hmm-mm)
                'Cause I'm still in love with the story of us
                We were young, but our love, it was real
                
                If I would've known those were the golden years
                I would've held you longer that night when you kissed me goodbye through your tears
                If I would've known those were the golden years
                I would've never left you alone when you needed me most, my dear
                
                'Cause those were the golden years (woo-ooh-ooh, woo-ooh-ooh)
                Those were the golden years (woo-ooh-ooh, woo-ooh-ooh)
                
                Those were the golden years
                """
        ),
        Item(
            title: "Bicara (feat. Monita Tahalea",
            author: "The Overtunes",
            description: nil,
            musicSearch: "Bicara The Overtunes",
            imageName: "Bicara",
            lyrics: """
                Sudah berapa lama aku
                Menunggu jawaban darimu
                
                Sampaikah kepadamu
                Kata-kata yang 'ku rangkaikan
                Agar kau tahu perasaanku
                Yang telah lama terpendam
                Inilah yang 'ku rasakan
                
                Jangan hanya bicara
                'Ku tak perlu kata-kata
                'Tuk mengerti yang kau rasakan
                Karena 'ku hanya butuh
                Separuh hatimu di dalam hidupku
                'Tuk buatku bahagia
                
                Sebut yang kau inginkan
                Apapun itu 'kan 'ku berikan untukmu
                Andai kau bersamaku
                Ditempat dan waktu yang sama
                Kau akan tahu perasaanku
                Yang telah lama terpendam
                
                Inilah yang ku rasakan
                
                Jangan hanya bicara
                'Ku tak perlu kata-kata
                'Tuk mengerti yang kau rasakan
                Karena 'ku hanya butuh
                Separuh hatimu di dalam hidupku
                'Tuk buatku bahagia
                
                Semenjak kau ada disini 'ku mengerti
                Betapa 'ku membutuhkanmu
                Bila kataku tak cukup 'tuk buatmu mengerti
                Ijinkanku bertemu lagi denganmu
                
                Jangan hanya bicara
                'Ku tak perlu kata-kata
                Tuk mengerti yang kau rasakan
                Karena 'ku hanya butuh
                Separuh hatimu di dalam hidupku
                'Tuk buatku bahagia
                (Ah... ah... ah...)
                
                Tuk buatku bahagia
                (Ah... ah... ah...)
                """
        ),
        Item(
            title: "Best Is Yet To Come",
            author: "Sandro Cavazza",
            description: nil,
            musicSearch: "Best Is Yet To Come Sandro Cavazza",
            imageName: "Best Is Yet To Come",
            lyrics: """
                I wanna live like no tomorrow
                And never think 'bout yesterday
                'Cause we could live without the sorrow
                It's just perspective anyway
                Even impossible is positive
                'Cause it has the word possible in it
                And the unthinkable is thinkable
                If you think for a minute
                And even untrustable is trustable
                If you put trust in it, yeah
                So put your trust in it, yeah
                
                The best is yet to come
                Don't worry 'bout a thing
                Whenever you feel down
                Don't let the troubles in
                The sun is gonna come
                Don't worry bout the rain
                Let's sit here for a while
                And watch it go away and just take it easy
                Let's take it easy and let the breeze in
                Just take it easy
                
                Don't really worry 'bout the future
                'Cause I will get there anyway
                And inside, it's okay to be a loser
                It's how you face it anyway
                
                Even impossible is positive
                'Cause it has the word possible in it
                And the unthinkable is thinkable
                If you think for a minute
                And the unlovable is lovable
                If you put your heart in it, yeah
                So put your heart in it, yeah
                
                The best is yet to come
                Don't worry 'bout a thing
                Whenever you feel down
                Don't let the troubles in
                The sun is gonna come
                Don't worry bout the rain
                Let's sit here for a while
                And watch it go away and just take it easy
                Just take it easy just take it easy
                Let's take it easy and let the breeze in
                Just take it easy
                """
        ),
        Item(
            title: "Best Part of Me (feat. YEBBA)",
            author: "Ed Sheeran",
            description: nil,
            musicSearch: "Best Part of Me ed sheeran (feat. YEBBA)",
            imageName: "Best Part of Me",
            lyrics: """
                My lungs are black, my heart is pure
                My hands are scarred from nights before
                And my hair is thin and fallin' out of all the wrong places
                I am a little insecure
                
                My eyes are crossed, but they're still blue
                I bite my nails and tell the truth
                I go from thin to overweight day-to-day it fluctuates
                My skin is inked, but faded, too
                
                But she loves me, she loves me
                Why the hell she love me
                When she could have anyone else?
                Oh, you love me, you love me
                Why the hell d'you love me?
                'Cause I don't even love myself
                
                Baby, the best part of me is you
                Lately, everything's makin' sense, too
                Oh, baby, I'm so in love with you
                
                I overthink and still forgive
                I lose my phone and place my bets
                And I never catch the train on time, always thirty minutes behind
                Your worries ain't seen nothin' yet
                
                But you love me, you love me
                Why the hell you love me so
                When you could have anyone else?
                Yeah, yeah
                He loves me, he loves me
                And I bet he never lets me go
                And shows me how to love myself
                
                'Cause, baby, the best part of me is you
                Whoa, lately, everything's makin' sense, too
                Baby, I'm so in love with you
                With you
                
                Baby, the best part of me is you
                Whoa, lately, everything's making sense, too
                Oh, baby, I'm so in love with you, oh
                Baby, I'm so in love with you, yeah, yeah
                Oh, baby, I'm so in love with you
                """
        ),
        Item(
            title: "No Judgement",
            author: "Niall Horan",
            description: nil,
            musicSearch: "No Judgement Niall Horan",
            imageName: "No Judgement",
            lyrics: """
                Barefoot and a bottle of wine
                You can stay with me tonight
                You don't have to change when I'm around you
                So go ahead and say what's on your mind
                On your mind
                
                When you're with me, no judgement
                You can get that from anyone else
                You don't have to prove nothing
                You can just be yourself
                When you're with me, no judgement
                We can get that from everyone else
                And we don't have to prove nothing
                When you're with me, no judgement
                
                Ohh, we don't have to prove nothing
                Mhm, when you're with me, no judgement
                
                I get us breakfast in the morning
                Or you can slip out in the night
                You don't have to give me a warning
                'Cause we both got nothing to hide
                Nothing to hide
                
                Even though we don't talk for a couple of months, yeah
                It's like we didn't lose anytime
                I can be your lover or your shoulder to cry on
                You can be whoever you like (oh)
                
                When you're with me, no judgement
                You can get that from anyone else
                You don't have to prove nothing
                You can just be yourself
                When you're with me, no judgement
                We can get that from everyone else
                And we don't have to prove nothing
                When you're with me, no judgement
                
                Ohh, we don't have to prove nothing
                Mhm, when you're with me, no judgement
                
                I hope we never change
                Even though we both know
                That we'll move on again
                I'll keep your secret safe
                'Til the time we both find
                Ourselves alone again (oh)
                
                When you're with me, no judgement (no judgement)
                You can get that from everyone else
                You don't have to prove nothing
                You can just be yourself
                When you're with me, no judgement (no judgement)
                We can get that from everyone else
                We don't have to prove nothing
                When you're with me, no judgement
                
                Ohh, we don't have to prove nothing
                Mhm (yeah), when you're with me, no judgement
                Ohh (no), we don't have to prove nothing
                Mhm, when you're with me, no judgement
                """
        ),
        Item(
            title: "The Commission",
            author: "CAIN",
            description: nil,
            musicSearch: "The Commission CAIN",
            imageName: "The Commission",
            lyrics: """
                See my hands and look at my feet
                It's okay if it's hard to believe
                I have faith you will do greater things
                It's my time to go but before I leave
                
                Go tell the world about me
                I was dead but now I live
                I've gotta go now for a little while
                But goodbye is not the end
                
                Don't forget the things that I taught you
                I've conquered death and I hold the keys
                Where I go you will go too, someday
                But there's much to do here before you leave
                
                Go tell the world about me
                I was dead but now I live
                I've gotta go now for a little while
                But goodbye is not the
                
                End of the journey, the end of the road
                My spirit is with you wherever you go
                You have a purpose and I have a plan
                I'll make you this promise
                I'll come back again but until then
                
                Go tell the world about me
                I was dead but now I live
                I've gotta go now for a little while
                But goodbye is not the end
                
                go tell them about me
                (Go tell the world) I've gotta go
                (Go tell the world) for a little while
                But goodbye is not the end
                """
        ),
        Item(
            title: "Remaja",
            author: "HIVI!",
            description: nil,
            musicSearch: "Remaja HIVI!",
            imageName: "Remaja",
            lyrics: """
                Kita remaja yang sedang dimabuk asmara
                Mengikat janji bersama selamanya
                Hati telah terikat, sepasang mata memikat
                Melambungkan asmara
                Yang selalu meminta
                Mengulur senja menanti datang
                Sang pemilik hati
                Rela menanti sejak terbit mentari
                Tak sabar 'tuk berbagi
                Segala isi di hati
                Ceriakan sanubari dan bercumbu di ujung hari
                
                Indahnya kisah-kasih kita di masa remaja
                Di bawah rayu senja kita di madu bermanja
                Tiada masa-masa yang lebih indah dari masa remaja
                Seakan dunia, milik berdua
                
                Hati terasa merindu tanpa rasa duka
                Berkumandang madu senandung asmara
                Kepada yang tercinta
                Nada-nada tercipta
                Genggam pesona jiwa
                Kuserahkan dan kau terima
                Kita dua insan
                Yang sedang bermadu kasih
                Tak peduli apa yang akan terjadi
                Yang kuinginkan saat ini
                Kau bersamaku disini
                
                Indahnya kisah-kasih kita di masa remaja
                Di bawah rayu senja kita di madu bermanja
                Tiada masa-masa yang lebih indah dari masa remaja (dari masa remaja)
                Seakan dunia
                Seakan dunia
                Seakan dunia, milik berdua
                Masa remaja
                Seakan dunia, milik berdua
                """
        ),
        Item(
            title: "Monokrom",
            author: "Tulus",
            description: nil,
            musicSearch: "Monokrom Tulus",
            imageName: "Monokrom",
            lyrics: """
                Lembaran foto hitam-putih
                Aku coba ingat lagi warna bajumu kala itu
                Kali pertama di hidupku
                Manusia lain memelukku
                
                Lembaran foto hitam-putih
                Aku coba ingat lagi wangi rumah di sore itu
                Kue coklat, balon warna-warni
                Pesta hari ulang tahunku
                
                Di mana pun kalian berada
                Kukirimkan terima kasih
                Untuk warna dalam hidupku dan banyak kenangan indah
                Kau melukis aku
                
                Lembaran foto hitam-putih
                Kembali teringat malam, kuhitung-hitung bintang
                Saat mataku sulit tidur, mm-mm
                Suaramu buatku lelap, mm-mm
                
                Di mana pun kalian berada
                Kukirimkan terima kasih
                Untuk warna dalam hidupku dan banyak kenangan indah
                Kau melukis aku
                
                Kita tak pernah tahu
                Berapa lama kita diberi waktu
                Jika aku pergi lebih dulu, jangan lupakan aku
                Ini lagu untukmu, ungkapan terima kasihku
                
                Lembar monokrom hitam-putih
                Aku coba ingat warna demi warna di hidupku
                Tak akan ku mengenal cinta
                Bila bukan kar'na hati baikmu
                """
        ),
        Item(
            title: "Night Changes",
            author: "One Direction",
            description: nil,
            musicSearch: "Night Changes One Direction",
            imageName: "Night Changes",
            lyrics: """
                Goin' out tonight, changes into somethin' red
                Her mother doesn't like that kind of dress
                Everything she never had, she's showin' off
                Drivin' too fast, moon is breakin' through her hair
                She's headin' for somethin' that she won't forget
                Havin' no regrets is all that she really wants
                
                (Ooh) We're only gettin' older, baby
                (Ooh) And I've been thinkin' about it lately
                (Ooh) Does it ever drive you crazy
                (Ah-ah-ah) Just how fast the night changes?
                (Ooh) Everything that you've ever dreamed of
                (Ooh) Disappearin' when you wake up
                (Ooh) But there's nothin' to be afraid of
                (Ah-ah-ah) Even when the night changes
                (Ooh) It will never change me and you

                Chasin' her tonight, doubts are runnin' round her head
                He's waitin', hides behind a cigarette
                Heart is beatin' loud and she doesn't want it to stop
                Movin' too fast, moon is lightin' up her skin
                She's fallin', doesn't even know it yet
                Havin' no regrets is all that she really wants
                
                (Ooh) We're only gettin' older, baby
                (Ooh) And I've been thinkin' about it lately
                (Ooh) Does it ever drive you crazy
                (Ah-ah-ah) Just how fast the night changes?
                (Ooh) Everything that you've ever dreamed of
                (Ooh) Disappearin' when you wake up
                (Ooh) But there's nothin' to be afraid of
                (Ah-ah-ah) Even when the night changes
                (Ooh) It will never change me and you
                
                Ooh, ooh, ooh, ooh
                Ooh, ooh, ooh
                Ooh
                
                Goin' out tonight, changes into somethin' red
                Her mother doesn't like that kind of dress
                Reminds her of the missin' piece of innocence she lost
                
                (Ooh) We're only gettin' older, baby
                (Ooh) And I've been thinkin' about it lately
                (Ooh) Does it ever drive you crazy
                (Ah-ah-ah) Just how fast the night changes?
                (Ooh) Everything that you've ever dreamed of
                (Ooh) Disappearin' when you wake up
                (Ooh) But there's nothin' to be afraid of
                (Ah-ah-ah) Even when the night changes
                (Ooh) It will never change, baby
                (Ooh) It will never change, baby
                (Ooh) It will never change me and you
                """
        ),
        Item(
            title: "Dancing (feat. Joe L Barnes & Tiffany Hudson)",
            author: "Elevation Worship",
            description: nil,
            musicSearch: "Dancing Elevation Worship (feat. Joe L Barnes & Tiffany Hudson)",
            imageName: "Dancing",
            lyrics: """
                Yeah
                Yeah
                Ohh, ohh, aye
                
                When you walked across the room
                And asked me to dance with you
                You said, "You're the one I choose"
                I couldn't believe it
                Like you weren't just passing by
                No, you looked me in my eyes
                And I found my paradise
                Oh, you are my paradise
                I'm not leaving
                
                Even if the sun drops out of the sky
                Even if the stars stop shining at night
                Even if the drummer stops keeping the time
                If your hands are in mine, I won't stop dancing
                Dancing on the mountain of a victory
                Dancing through the valley of a broken dream
                Dancing on the plains of the in-between
                If it's you and me, I won't stop dancing
                Mmm, I won't stop dancing
                
                Mmm, mmm
                
                We've made some memories
                Yeah we've got some history
                If we told them everything
                They'd never believe it (never, never)
                So many loves out there (out there)
                But none of them can compare
                To this sacred space we share
                Ohh, ohh I'm dancing away my cares
                I'm not leaving
                
                Even if the sun drops out of the sky
                Even if the stars stop shining at night
                Even if the drummer stops keeping the time
                If Your hands are in mine
                I won't stop dancing
                Dancing on the mountain of a victory
                Dancing through the valley of a broken dream
                Dancing on the plains of the in between
                If it's You and me
                I won't stop dancing (ohh, ohh)
                I won't stop dancing
                I won't stop dancing
                
                To the right
                To the left
                When you step I step
                I won't stop dancing
                To the right
                To the left
                When you step I step
                I won't stop dancing
                To the right
                To the left
                When you step I step
                I won't stop dancing
                To the right
                To the left
                When you step I step
                I won't stop dancing
                To the right
                To the left
                When you step I step
                I won't stop dancing
                To the right
                To the left
                When you step I step
                I won't stop dancing
                To the right
                To the left
                When you step I step
                I won't stop dancing
                To the right
                To the left
                When you step I step
                Oh, I won't stop dancing
                
                Even if the sun drops out of the sky
                Even if the stars stop shining at night
                Even if the drummer stops keeping the time
                If your hands are in mine
                I won't stop dancing
                Dancing on the mountain of a victory
                Dancing through the valley of a broken dream
                Dancing on the plains of the in between
                If it's you and me (ohh, ohh)
                I won't stop dancing
                I won't stop dancing (ohh, yeah)
                I won't stop dancing
                Ohh, ohh, I won't stop dancing (ooh, ooh)
                I won't stop dancing
                Ohh, ohh
                I won't stop dancing
                
                To the right
                To the left
                When you step I step
                No, I won't stop dancing
                To the right
                To the left
                When you step I step
                I won't stop dancing
                """
        ),
        Item(
            title: "Pelangi",
            author: "HIVI!",
            description: nil,
            musicSearch: "Pelangi HIVI!",
            imageName: "Pelangi",
            lyrics: """
                Ku ingin cinta hadir untuk selamanya
                Bukan hanya lah untuk sementara
                Menyapa dan hilang
                Terbit tenggelam bagai pelangi
                Yang indahnya hanya sesaat
                Tuk ku lihat dia mewarnai hari
                
                Tetaplah engkau disini
                Jangan datang lalu kau pergi
                Jangan anggap hatiku
                Jadi tempat persinggahanmu
                Untuk cinta sesaat
                
                Mengapa ku tak bisa jadi
                Cinta yang tak akan pernah terganti
                (ku hanya menjadi) cinta yang tak akan terjadi
                Lalu mengapa kau masih disini
                Memperpanjang harapan
                
                Tetaplah engkau disini
                Jangan datang lalu kau pergi
                Jangan anggap hatiku
                Jadi tempat persinggahanmu
                Untuk cinta sesaat
                
                Kau bagai kata yang terus melaju
                Di luasnya ombak samudera biru
                Namun sayangnya kau tak pilih aku
                Jadi pelabuhanmu
                
                Tetaplah engkau disini
                Jangan datang lalu kau pergi
                Jangan anggap hatiku
                Jadi tempat persinggahanmu
                
                Bila tak ingin disini
                Jangan berlalu lalang lagi
                Biarkanlah hatiku
                Mencari cinta sejati
                Wahai cintaku
                Wahai cinta sesaat
                """
        ),
        Item(
            title: "Mamas",
            author: "Anne Wilson & Hillary Scott",
            description: nil,
            musicSearch: "Mamas Anne Wilson & Hillary Scott",
            imageName: "Mamas",
            lyrics: """
                I don't know why God made one-bedroom apartments out of state
                I don't know why He made hometowns if it's somewhere I can't stay
                I don't know why He made growing up but I guess that we're all gonna
                Yeah, I don't know a lot of things but I know why God made mamas
                
                For the open arms to fall into
                For the when you don't know what to do
                For the phone call sayin', "Don't forget, I'm always in your corner"
                For the heart that makes a house a home
                For the knowing that you're not alone
                For the "Darling, don't you dare give up even when you wanna"
                Yeah, that's why God made mamas
                
                For putting band-aids on a scrapеd up knee and wiping tears away
                For picking up the piecеs when that dream don't go your way
                For always giving more than taking, always knowing what ya need
                And showing you that fighting's always best done on your knees

                For the open arms to fall into
                For the when you don't know what to do
                For the phone call sayin', "Don't forget, I'm always in your corner"
                For the heart that makes a house a home
                For the knowing that you're not alone
                For the "Darling, don't you dare give up even when you wanna"
                Yeah, that's why God made mamas
                
                Oh-oh-oh-oh-oh, oh-oh-oh-oh (Oh-oh-oh-oh)
                Mamas, mamas
                
                I don't know why God made living life down here so hard to do
                But I know why God made mamas 'cause He knew I needed you
                Oh-oh, oh-oh
                
                For the open arms to fall into (To fall into)
                For the when you don't know what to do (Know what to do)
                For the phone call sayin', "Don't forget, I'm always in your corner"
                (I'm always in your corner)
                For the heart that makes a house a home
                For the knowing that you're not alone (Not alone)
                For the "Darling, don't you dare give up even when you wanna"
                Yeah, that's why God made mamas (Mamas)
                
                Oh-oh-oh-oh-oh (Mamas)
                Oh-oh-oh-oh (Mamas)
                (Mamas)
                Mm-mm-mm (Mamas)
                """
        ),
        Item(
            title: "First Times",
            author: "Ed Sheeran",
            description: nil,
            musicSearch: "First Times Ed Sheeran",
            imageName: "First Times",
            lyrics: """
                I thought it'd feel different playing Wembley
                Eighty thousand singing with me
                It's what I've been chasing 'cause this is the dream
                
                When it was all over, I cleared out the room
                Grabbed a couple beers, just me and you
                Then we start talking the way that we do
                
                Ain't it funny how the simplest things in life can make a man?
                Little moments that pass us by
                Oh, but I remember
                
                The first kiss, the first night, the first song that made you cry
                The first drink, red wine, on a step in Brooklyn
                I still feel the first fight, and we both made it out alive
                And I can't wait to make a million more first times
                (Mm-hmm, mm-hmm)
                
                The greatest thing that I have achieved
                This four little words, down on one knee
                Said, "Darling, are you joking?"
                And I just said, "Please"
                
                Ain't it funny how the simplest things in life can make a man?
                Little moments that pass us by
                Oh, but I remember
                
                The first kiss, the first night, the first song that made you cry
                The first look in your eyes when I said, "I love you"
                I can still feel the butterflies from when we stumbled home that night
                I can't wait to make a million more first times
                (Mm-hmm, mm-hmm)
                
                Ain't it funny how the simplest things in life can make a man?
                Little moments that pass us by
                Oh, but I remember
                
                First kiss, first night, first song that made you cry
                First dance, moonlight, in your parents' garden
                I can't wait to see everything that's yet to be
                Our first child, and then a million more first times
                """
        ),
        Item(
            title: "GOODBYE YESTERDAY",
            author: "ELEVATION RHYTHM & Gracie Binion",
            description: nil,
            musicSearch: "GOODBYE YESTERDAY ELEVATION RHYTHM & Gracie Binion",
            imageName: "Goodbye Yesterday",
            lyrics: """
                Hands up
                
                Goodbye, yesterday
                I'm livin' in the light of a new day
                I won't waste another minute in my old ways
                Praise the Lord, I've been born again
                Goodbye, yesterday
                I'm livin' in the light of a new day
                I won't waste another minute in my old ways
                Praise the Lord, I've been born again (yeah)
                
                Oh, I've been born again
                
                Again and again and again and again
                You rescued me out of the mess I was in
                You traded my sorrow for something to sing
                Now, I'm dancin' on the grave that I once lived in
                
                Goodbye, yesterday
                I'm livin' in the light of a new day
                I won't waste another minute in my old ways
                Praise the Lord, I've been born again
                Goodbye, yesterday
                The Spirit of the Lord is upon me
                I've got resurrection in my veins
                Praise the Lord, I've been born
                
                Again and again and again and again
                You rescued me out of the mess I was in
                You traded my sorrow for something to sing
                Now, I'm dancin' on the grave that I once lived in
                
                Again and again and again and again
                You rescued me out of the mess I was in
                You traded my sorrow for something to sing
                Now, I'm dancin' on the grave that I once lived in
                
                Come on, we sing
                
                I have decided to follow Jesus
                The world behind, the Cross before
                And I won't turn back (yeah)
                I have decided to follow Jesus
                The world behind, the Cross before
                And I won't turn back
                
                Sing, I have decided (I have decided)
                To follow Jesus (to follow Jesus)
                I'm gonna leave the world behind
                The world behind, the Cross before me
                (And I won't turn back)
                
                And I have decided (I have decided)
                To follow Jesus (to follow Jesus)
                (The world behind) the world behind, the Cross before
                And I won't turn back
                
                Singing, I won't turn back (I won't turn back)
                And I won't turn back (and I won't turn back)
                No-no, no-no, no
                The world behind and the Cross before
                And I won't turn back
                Singing, I won't turn back (I won't turn back)
                And I won't turn back (I won't turn back)
                No-no, no-no, no-no
                The world behind and the Cross before me
                (And I won't turn back)
                
                Again and again and again and again
                You rescued me out of the mess I was in
                You traded my sorrow for something to sing
                Now, I'm dancin' on the grave that I once lived in
                
                Again and again and again and again
                You rescued me out of the mess I was in
                You traded my sorrow for something to sing
                Now, I'm dancin' on the grave that I once lived in
                
                Whoa, oh, whoa-oh-oh, yeah
                Praise the Lord, I've been born again
                Praise the Lord, I've been born again (hands up, hands up)
                
                Now, I'm dancin' on the grave that I once lived in
                Oh, yeah
                Now, I'm dancin' on the grave that I once lived in
                Yeah, yeah
                Now, I'm dancin' on the grave that I once lived in
                You ought to dance for the Lord
                Dancin' on the grave that I once lived in
                (Oh) I'm dancin' on the grave that I once lived in
                Dancin' on the grave that I once lived in
                Dancin' on the grave that I once lived in
                (Ohh, hey) dancin' on the grave
                Now, I'm dancin' on the grave that I once lived in
                Dancin' on the grave that I once lived in
                Dancin' on the grave that I once lived in
                Oh, praise the Lord, I've been born again
                """
        ),
        Item(
            title: "Look How Far You've Come",
            author: "Joshua Bassett",
            description: nil,
            musicSearch: "Look How Far You've Come Joshua Bassett",
            imageName: "Look How Far You've Come",
            lyrics: """
                I know you can't see the light right now
                They buried you alive with no way out
                You're screamin' underwater
                But nobody hears a sound
                You taught yourself to swim so you don't drown
                
                But just in case nobody told you this today
                
                Look how, look how
                Look how far you've come
                You've been running, running
                Running for too long
                
                What goes up comes back down
                Just to circle back around
                I know you're not nearly done
                When you can't seem to get back up
                
                Just look how, look how
                Look how far you've come
                
                I wish I could hold my younger self
                I'd say, "Cry a little longer if it helps" (hm-mm)
                'Cause you can't choose the place you're born
                Your hair, your name, your baby clothes
                But getting here, you did that on your own
                
                And just in case nobody told you this today
                
                Look how, look how
                Look how far you've come
                You've been running, running
                Running for too long
                
                What goes up comes back down
                Just to circle back around
                I know you're not nearly done
                When you can't seem to get back up
                
                Just look how, look how
                Look how far you've come
                
                Oh, and in case that you forget
                The last time you were here
                You swore that it would never end
                Uh-ooh
                
                Oh and, darling, catch your breath
                The world is gonna need your love
                So do the best you can
                Oh, I promise someday it'll all make sense
                
                Look how, look how
                Look how far you've come
                You've been running, running
                Running for too long
                
                What goes up comes back down
                Just to circle back around
                I know you're not nearly done
                When you can't seem to get back up
                
                Just look how, look how
                Look how far you've come
                
                Hm-mm, hm-mm
                Hm
                """
            )
    ]
}

