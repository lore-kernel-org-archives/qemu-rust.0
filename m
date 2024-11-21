Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tEAfm-00046S-LL
	for mharc-qemu-rust@gnu.org; Thu, 21 Nov 2024 12:08:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAe0-00010Y-QV
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 12:07:04 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAdY-0001iX-N5
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 12:07:04 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4315839a7c9so10246225e9.3
 for <qemu-rust@nongnu.org>; Thu, 21 Nov 2024 09:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732208795; x=1732813595; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZYyjcmwGZcc7NttBsBYoWNTe7fj51f/J/c4PbwCrSW0=;
 b=PejqfVPoBL4glanT7r79oYFDkwi83yLvILxohLx52bggyI+zXGpqzjtgwTjhKhpp4e
 F/JqLn5dCkHIGKnc05ZbvulOxcj/Z6KEu7CHypxrUAyytEkoxBcHfEkpvE4Yf0vZ/vE9
 QM18a9JuEce3i8Jr6E5QiPVxNLpI3Zrr7grkJK2Tw2HO6ia4jqOMDbG/ujGd79iEDOUQ
 H1wHM8tj9erRBAiJvClN7nncj9uudY6UqMioSqhahUT1yci3jVScS5eAPT8nYvKsk7tL
 8V97O2n0mFEy+UQolA09RFwcwjCFeZGM6lXx+22qRv+cGF0InEml8WNlRRcWQm8bnfiK
 lnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732208795; x=1732813595;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZYyjcmwGZcc7NttBsBYoWNTe7fj51f/J/c4PbwCrSW0=;
 b=OsSW908nKI9B5cXzYv1m6H5070GVGUnqbXzOR3EN36fn0azZqRfB3C7yJXwS8CZvk4
 hyIkdzepdvsjvTdQQ366tdb1RlX+aLUUykpFAaWLfSXRFDSknpoVZqdUQAcugMqO/Z6+
 z4bU+6SVlP3hwvT6NbHKNkKmjhnbWFrbi9RAxTefrsMv0CcphazrAhW9Ozlf9cvKqi5c
 RKASV2V3ie4zkS3vB7uQ2K5tbczKbi7oaJF1SV4RvMJgEnEMpI4vaJubTD7ldRc8vzN8
 bgyY8XS0eEJr+P4HKoT9T5EHM3h2FwmJoXn9vQ/42P2T9Ql1ghUsDqjMKar8qfR+KMxx
 vtWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuHms7OnxSoQpH6wkCZL5kOmWgZpP948S0FuYAK7Za3zWjsoFnXSaWLrRumpID4pAU8d1VlRVFdG0=@nongnu.org
X-Gm-Message-State: AOJu0YzrgNDSQ9k4rJRfMcylyvFQdzVdtwmSdPhg5R1mjh72g784rwA9
 mi3vjPotyRlwG7Ndkyvo+bKDH7WH5t5W4eLB1SpB7uQq6Ftn1NkHFjCci1kVObI=
X-Gm-Gg: ASbGncuIEhO0uI6IWnSklNZvxFVRbeAmi458BuBtfRfKOZUp5Wc4gCgHdAAQU/A6iV9
 +1PvG9gAOipdQMNYHGPeZYKTzAhz8EmGpBYMICoWRvxhFy3pwzb3piV55skMRU8Lpf3/CYpV48/
 eJAlsAxoPY3OILTeMr16CRJTAB2g7K/sgBk/FvY/fpt9jFYMM63FeFHDzUkUa9pU/wmZ9w8A2Ym
 2/yUu/zxmkxKa25wGYF54N+Inbc1nl44VtC90je0Osl9JAU
X-Google-Smtp-Source: AGHT+IEzMrGkl+YSMzaGV8afQzDZmynkhbb/zDv35PnZsmLYJaYum1VwMogQ8i2Vgpj+WEtSs5JrcQ==
X-Received: by 2002:a05:6000:2a7:b0:382:4b69:9c75 with SMTP id
 ffacd0b85a97d-38254b17f80mr6364450f8f.43.1732208793832; 
 Thu, 21 Nov 2024 09:06:33 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fafeceesm53837f8f.37.2024.11.21.09.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 09:06:30 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id DDBC660500;
 Thu, 21 Nov 2024 16:58:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-riscv@nongnu.org,
 Thomas Huth <huth@tuxfamily.org>, Bernhard Beschow <shentey@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-s390x@nongnu.org,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-rust@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Markus Armbruster <armbru@redhat.com>,
 Weiwei Li <liwei1518@gmail.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Ani Sinha <anisinha@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Junjie Mao <junjie.mao@hotmail.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH 38/39] rust/pl011: Fix range checks for device ID accesses
Date: Thu, 21 Nov 2024 16:58:05 +0000
Message-Id: <20241121165806.476008-39-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
X-List-Received-Date: Thu, 21 Nov 2024 17:07:09 -0000

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
---
 rust/hw/char/pl011/src/device.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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


