Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tFatu-000423-8K
	for mharc-qemu-rust@gnu.org; Mon, 25 Nov 2024 10:21:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tFats-000414-Ie
 for qemu-rust@nongnu.org; Mon, 25 Nov 2024 10:21:20 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tFatq-0001nB-C9
 for qemu-rust@nongnu.org; Mon, 25 Nov 2024 10:21:20 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4316f3d3c21so40169365e9.3
 for <qemu-rust@nongnu.org>; Mon, 25 Nov 2024 07:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732548077; x=1733152877; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DMELCxkOeEAQmSk+N63B9qvpt489uBLoYc1oFZtPpjQ=;
 b=pChjgK741wVwzfY7TnC/KMBlYHW7x6MktMDt4o39LYBILUSFMT1n8u6Bni1/FkIeR1
 SbYDGmcT/qDxeLjG7RaHn5lQcH9l+GfxS0QieZhXgLCPNNkTWFBSfnRxJl6Pc9v6dsaJ
 A4ovCt9RhrsLdKYNMBMXaihw74FqWZaDE/tlED9XrCmer1WOBjHKlL1RjpSdyNipam9u
 tPJ79eg+/eCvideDudz0NOUf9GyhD6udUkBNdXg62Ibm1smvjihJgjVyJoMbi6+SxbGM
 aFSjcDKBFdg6rDMuXKLaqbYan3tK8nzreEfZY7c/QkY9Hd4kvlVYrj9dBlsLh5gREY1W
 ufrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732548077; x=1733152877;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DMELCxkOeEAQmSk+N63B9qvpt489uBLoYc1oFZtPpjQ=;
 b=rz23yJ5J3qUZ4qPzU9WBeVAzC8imKnRoIEATE4lzzD6gEOqJ/pF1XDcqcTIW0AIE1x
 Cvf+pd6G6WcLryxl2pfsvuvdeI0hN1nH7lcS+im4uJHWeHjMWzxYgNBuI3zetkJzajXT
 bYZSMyGuL+k3wQrB1OK4P5qHajpisbVX94RcMRTKvYgnDcgaMZWjQskw+oTGUX9nU1cP
 Gc7R0N+TTn3ZfD+NU+iIPrGJnVYA0eWR79ElGeiAQzsTo3gV+Mf2UnRUF5ZVK83r61yi
 Res4ytkkySOsIGu7TtUuxdMsMCEzVT5tLByJe2r2MVwX8z/q8Ai/vrQwCkkmhb/uQNjz
 l8Kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFNMGS/va0NfduRGHZs0+n5X8jZs50RKliPHvbRS5vnl0WUHX1CPLLfW5r6AMzGSSoSi2ModNlvaE=@nongnu.org
X-Gm-Message-State: AOJu0YxkWjGxhROMrwl1/iBnkNnreZ9EYffiJSSoz58T5zSwDTVUDISr
 4/u+vinxf+R5QWEgaYKgLjjkox5+DNTg2OPbH5YDS9Ow+3PiTBX1fvOfV8EjyHNJn74KpCDTiPv
 P
X-Gm-Gg: ASbGnctZH6Wdrc6B1sG8sW6lafO+LNAJEJwvIUEmEvz4aaXOLB7XQW7aDMDSy3AwCqt
 OOo9vG4+lA/03q4s3Wu2B5x4tpUPIpQTvJaluVcxjxJhKofBe+Bqt+Soz0VO0AI3CwPoZK8B+ax
 o7tFpqwCEvcXvG/LVJSydkcxLdu5D2JZyPElyKGBgt+3WMbhcZb56Uw+x1KsYrrkV8p5Adyaq40
 tN1PvACbsIZD9l4GWIR7Qx+64nO+DHOzXyyy9nwPoFuPdnd
X-Google-Smtp-Source: AGHT+IHpnTS6RQp+PRADd2JYlCHgAbWaolF6kyisKI/7HjbmaUXXA9ritrcshd9FtN1wv954DPWxlw==
X-Received: by 2002:a05:600c:3aca:b0:431:680e:95ff with SMTP id
 5b1f17b1804b1-433ce425617mr118928725e9.9.1732548076810; 
 Mon, 25 Nov 2024 07:21:16 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4349fba472asm38343535e9.17.2024.11.25.07.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2024 07:21:15 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id F362D63331;
 Mon, 25 Nov 2024 15:21:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Junjie Mao <junjie.mao@hotmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 qemu-rust@nongnu.org (open list:Rust-related patc...)
Subject: [PULL 24/28] rust/pl011: Fix range checks for device ID accesses
Date: Mon, 25 Nov 2024 15:21:01 +0000
Message-Id: <20241125152105.2100395-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125152105.2100395-1-alex.bennee@linaro.org>
References: <20241125152105.2100395-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Nov 2024 15:21:20 -0000

From: Junjie Mao <junjie.mao@hotmail.com>

The peripheral and PrimeCell identification registers of pl011 are located at
offset 0xFE0 - 0xFFC. To check if a read falls to such registers, the C
implementation checks if the offset-shifted-by-2 (not the offset itself) is in
the range 0x3F8 - 0x3FF.

Use the same check in the Rust implementation.

This fixes the timeout of the following avocado tests:

  * tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_virt
  * tests/avocado/replay_kernel.py:ReplayKernelNormal.test_arm_virt
  * tests/avocado/replay_kernel.py:ReplayKernelNormal.test_arm_vexpressa9

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Junjie Mao <junjie.mao@hotmail.com>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <SY0P300MB102644C4AC34A3AAD75DC4D5955C2@SY0P300MB1026.AUSP300.PROD.OUTLOOK.COM>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20241121165806.476008-39-alex.bennee@linaro.org>

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index 2a85960b81..476cacc844 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -182,7 +182,7 @@ pub fn read(&mut self, offset: hwaddr, _size: c_uint) -> std::ops::ControlFlow<u
         use RegisterOffset::*;
 
         std::ops::ControlFlow::Break(match RegisterOffset::try_from(offset) {
-            Err(v) if (0x3f8..0x400).contains(&v) => {
+            Err(v) if (0x3f8..0x400).contains(&(v >> 2)) => {
                 u64::from(self.device_id[(offset - 0xfe0) >> 2])
             }
             Err(_) => {
-- 
2.39.5


