Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tEAfn-0004Ak-OQ
	for mharc-qemu-rust@gnu.org; Thu, 21 Nov 2024 12:08:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAe6-0001B8-0z
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 12:07:10 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAdb-0001kM-2n
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 12:07:06 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4314b316495so9521265e9.2
 for <qemu-rust@nongnu.org>; Thu, 21 Nov 2024 09:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732208797; x=1732813597; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=15r2zOo3h/tLFRcXUbTt3Vo+3asDF32OSYsCrEmK4kE=;
 b=hQwG/zYWbKN9L5g3/UIbI9fYCxo6OX8xUX0qZb8EvnDglpqFOdR4djI0mD0j8Kxu9f
 dxMh0qqQTgiDL8adKUzgV5hNRr8Ud1m0budgSoSD9vR4tCjBdpb4bMmd+hAxvauTDdkh
 3EUYdA8OKoiKIWbjtxI1gHLbROvH0UKJI3yaFJxGchgFA5TykyCij2jJc4aTpJ3ITTBB
 Biqa66k0tYq3ptzYT26NTh6ZqeQFMmJQrxHS1WatCw1RwrMvtE5y2YENffPEyfxiqpmW
 RCY1FzPynjDdLwx2FbPNU+Lh/v/PTC/2p/1XNvTfYDY14JQnUyPxN5lOfOzGbEUIxUEB
 YQMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732208797; x=1732813597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=15r2zOo3h/tLFRcXUbTt3Vo+3asDF32OSYsCrEmK4kE=;
 b=tOksDFivpv5bnYlp966Lh0yirCUTZK/QrhhOy6dBGHUDvf//bBXGTOmqW9nOoZ/TWZ
 JkVPOS8HfIWkDqIYCy2jWFZ2xHUs736QbcJ6SZ5o7SJkw1gb0npqyQ5Zm64tIiIm4790
 pPRm4rLOOa3ISCbJZaOScud1mLV3C2ljUvcOmRSyZ1HNXqxezN6A0TD893XN4LX/WIMD
 eGH1zc7ZKBUqrHFSrItHGEMygtmrBW4I74kQrxzTOZWxJXSRCbOakTTXN+YOstzvbKxs
 VDzTzfTloWuVh7bTudmmzYxjJZPSNCs3VqbtxAP2v3oCZPDVV0MDsSjSeyWN9BaZ7Fgi
 dT4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4ssmFMumCGnn7ILBpO0bZDPRIEdJtJoiKL3tmJ9brOp2ejZ95VMlHuu9Q50yqDRWRZpywdkwc68g=@nongnu.org
X-Gm-Message-State: AOJu0YxSRfXC/yYErcSmt20655mbpbrIlaj0v6bpQ6ESXHOnbdKSAiFY
 wo/D7/gQ0LVEAC/21x89F6xyCJnBcKrxf0zGzJGaAckDotDWCQAij+uwwc96qtc=
X-Gm-Gg: ASbGncvuzlmBBCdNMsQ7yMvlCLKhAzx2wgRvRz3SQl0SKX/hyEU2ctlQDlYN51xplLZ
 yd9QGvdXC4E0+tJ/12dvV7YSPrnuwQKLFnQbR3Zq3glJi6g8N7D2HDhj5hw70/BtSowaqQALX2s
 0p6p6EgMMimxAEfX73xUrreGHp6fEcDTOnDXa6Klx7ZOzN8W51x18BDG4xSFlfK+is7x5xhujUV
 GRHQZwRxdxVMYEpQW2V8wTFSmJVF+ouqrvoAsUYaA+CmfCv
X-Google-Smtp-Source: AGHT+IFaGeGPn+pHoTGPKbHBecPHbcYySHEDjo+MmD2pitOufTZGav1pXWeddCZm9hXoafQDOB6suQ==
X-Received: by 2002:a05:600c:3493:b0:431:6060:8b16 with SMTP id
 5b1f17b1804b1-4334f02c6f9mr74451045e9.30.1732208794422; 
 Thu, 21 Nov 2024 09:06:34 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433b45d170esm61614305e9.3.2024.11.21.09.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 09:06:32 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id E350860481;
 Thu, 21 Nov 2024 16:58:08 +0000 (GMT)
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
 Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH 27/39] tests/functional: update the mips64el tuxrun tests
Date: Thu, 21 Nov 2024 16:57:54 +0000
Message-Id: <20241121165806.476008-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
X-List-Received-Date: Thu, 21 Nov 2024 17:07:13 -0000

Now there are new upto date images available we should update to them.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Anders Roxell <anders.roxell@linaro.org>
---
 tests/functional/test_mips64el_tuxrun.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/functional/test_mips64el_tuxrun.py b/tests/functional/test_mips64el_tuxrun.py
index 819549a27b..0a24757c51 100755
--- a/tests/functional/test_mips64el_tuxrun.py
+++ b/tests/functional/test_mips64el_tuxrun.py
@@ -17,11 +17,11 @@
 class TuxRunMips64ELTest(TuxRunBaselineTest):
 
     ASSET_MIPS64EL_KERNEL = Asset(
-        'https://storage.tuxboot.com/20230331/mips64el/vmlinux',
-        'd4e08965e2155c4cccce7c5f34d18fe34c636cda2f2c9844387d614950155266')
+        'https://storage.tuxboot.com/buildroot/20241119/mips64el/vmlinux',
+        '0d2829a96f005229839c4cd586d4d8a136ea4b488d29821611c8e97f2266bfa9')
     ASSET_MIPS64EL_ROOTFS = Asset(
-        'https://storage.tuxboot.com/20230331/mips64el/rootfs.ext4.zst',
-        'fba585368f5915b1498ed081863474b2d7ec4e97cdd46d21bdcb2f9698f83de4')
+        'https://storage.tuxboot.com/buildroot/20241119/mips64el/rootfs.ext4.zst',
+        '69c8b69a4f1582ce4c6f01a994968f5d73bffb2fc99cbeeeb26c8b5a28eaeb84')
 
     def test_mips64el(self):
         self.set_machine('malta')
-- 
2.39.5


