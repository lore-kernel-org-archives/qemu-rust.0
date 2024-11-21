Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tEAdf-0000JF-Og
	for mharc-qemu-rust@gnu.org; Thu, 21 Nov 2024 12:06:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAdd-0000AE-K8
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 12:06:42 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAdR-0001aH-Bi
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 12:06:41 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43162cf1eaaso13579635e9.0
 for <qemu-rust@nongnu.org>; Thu, 21 Nov 2024 09:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732208785; x=1732813585; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v7PcFAUN+QI/IN3kZDWblpe2r+If/B/i2TwqX+gbbUo=;
 b=OT+O1/6GSZ4e4tEC2oLxctCKAgLNKE4RstYOgkzEyCZJZLF+595lCEx32F/ehZaG54
 hPWBL8pYNVvbbE+AvsG7laZbs4aSBwa5R+it1FFdo3fuMn7tJI0Tkn0jPbwbnN3+DSVS
 kPCsjD4eWoHwAZsUE2ChOlvleAN61MXFQE3ZA3QlVS8yZAGtRpcj1OQhPVLT2L+pwIp+
 v33wcZuzCDSAG4NDsfmm3nR5J/HM0ZQ0kyRTqFr/KjFnmJzWxbkmk/0cEDyTki61YQ11
 XX2JKMbc/lC2qUjbhkZ0Ekq1k8XIidgqfym/b4ztHizz1VPE5/hKDtxO8MAAssvTwrOL
 KjIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732208785; x=1732813585;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v7PcFAUN+QI/IN3kZDWblpe2r+If/B/i2TwqX+gbbUo=;
 b=YZzt3jnxPaEwkbW6mRipH9mmDCWqXMh8q9GmpMwcxQKDCZ8KXgRZ7+q4SvhfwLLtbc
 kq2V3g1o49+0MlOuztf0IG/pmy7f2nsWcBZ94SsdrlgUa4Um+5Pti1rSa0oFhFEoIDth
 5Dr28eO908EJhK2gAl4KKZxT4jpGW0wumRN3GIFytngK3ytH/LXboXW5nwPDHDIQ+A3J
 LdOppuoe0+z/6Bilq2VGpt52tbf3hq5lBevp6JbHR5vWwinNSy6GRSlnwhuACbM6g9V/
 TzqwS95Hj1F5tfQhfgY9OmcLy/0G8/wpkKuV+HTJTEqLB3HsPHuBv7DryJ+Sx4y9CKkD
 qbdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmV8Hg5x319QhfVjjkZol8ZYNUdKhF2Tg4yUvAgjFFJ82FUfzHTZ4MjQv18SSSGaDVXm96zalv0Ug=@nongnu.org
X-Gm-Message-State: AOJu0YxA+KJV/VjEegnAEsoCwNyuznx5wCRbUe3vX3yKXLr0VE5ehvQH
 jeDyqOfaIeH9khFRKmD2RTmsnC8W+u1fL8Wbtodeb+qQbioxY/HjlE9w4Wm/k34=
X-Gm-Gg: ASbGncuXY/5SxUjvA+A2PH88dbipqkUqZaUuUAtWReZz7uJ50Dmy9paoMWu+OfPWgPX
 QwbKt63JQiAaFevnmkC2+rzzmnRmcvaEZIXlZCCIjy5t4fMdgIUnYlw1ZDRr0QpNnpuVk26e/fB
 VyQfcxEzYPE4XGvfgyv6uNAqnOjGANxnkEywVaKh0nSiqxzqde2X5mlX9hiOP6S6t1YXftZTmK1
 epWFld8O87sKRnjFpJNH14jHNwhRpHI74AypkI8Y8BnZQlT
X-Google-Smtp-Source: AGHT+IFkNgK64zCIjQB60w+M5qeXV/kUk+nLtFcGA8ZCFcwj0g8v0GKlHRzArsN/q7iyvIyLdop68w==
X-Received: by 2002:a05:600c:5013:b0:431:54f3:11ab with SMTP id
 5b1f17b1804b1-4334f01e2a7mr71165055e9.33.1732208785021; 
 Thu, 21 Nov 2024 09:06:25 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432f643b299sm61613635e9.0.2024.11.21.09.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 09:06:23 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 9B52D60454;
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
Subject: [PATCH 24/39] tests/functional: update the mips32 tuxrun tests
Date: Thu, 21 Nov 2024 16:57:51 +0000
Message-Id: <20241121165806.476008-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 21 Nov 2024 17:06:42 -0000

Now there are new upto date images available we should update to them.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Anders Roxell <anders.roxell@linaro.org>
---
 tests/functional/test_mips_tuxrun.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/functional/test_mips_tuxrun.py b/tests/functional/test_mips_tuxrun.py
index 6fec44c2bf..6771dbd57e 100755
--- a/tests/functional/test_mips_tuxrun.py
+++ b/tests/functional/test_mips_tuxrun.py
@@ -17,11 +17,11 @@
 class TuxRunMipsTest(TuxRunBaselineTest):
 
     ASSET_MIPS_KERNEL = Asset(
-        'https://storage.tuxboot.com/20230331/mips32/vmlinux',
-        'bfd2172f8b17fb32970ca0c8c58f59c5a4ca38aa5855d920be3a69b5d16e52f0')
+        'https://storage.tuxboot.com/buildroot/20241119/mips32/vmlinux',
+        'b6f97fc698ae8c96456ad8c996c7454228074df0d7520dedd0a15e2913700a19')
     ASSET_MIPS_ROOTFS = Asset(
-        'https://storage.tuxboot.com/20230331/mips32/rootfs.ext4.zst',
-        'fc3da0b4c2f38d74c6d705123bb0f633c76ed953128f9d0859378c328a6d11a0')
+        'https://storage.tuxboot.com/buildroot/20241119/mips32/rootfs.ext4.zst',
+        '87055cf3cbde3fd134e5039e7b87feb03231d8c4b21ee712b8ba3308dfa72f50')
 
     def test_mips32(self):
         self.set_machine('malta')
-- 
2.39.5


