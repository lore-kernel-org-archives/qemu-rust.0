Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tEAfK-0002z2-IK
	for mharc-qemu-rust@gnu.org; Thu, 21 Nov 2024 12:08:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAdu-0000lO-Ul
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 12:07:00 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAdU-0001eZ-UO
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 12:06:56 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-38245e072e8so1091383f8f.0
 for <qemu-rust@nongnu.org>; Thu, 21 Nov 2024 09:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732208791; x=1732813591; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KPkgZb+7aZINgr5AlSQc2tvBZSl4x/+JOpQj7wrbfcA=;
 b=PDWRn1WpVxwaNmwFUXo+zQ1gD7vFSyhgPAf9nrUWwsoelI3mzle0b71EfpUBZ5TCyN
 L+9WKZWvZdfgqzAb1feWNRTqwzaF6UPzhF23E23zDvVNSLA+b5PmwdzG23sTbas7nuwQ
 oUtl9NH1g5Weo2CvTaEAEJbEfUHptPRZYLVQIgZrug0Ix7bH3+GygvGoFZIt4Ll0aHlG
 Ng1IXJPf8sH4mVc74n9AjxwPvEafCAP+1JqXjtNwaBRIlYqThTfNF1DHek9TEC1IwFaQ
 IrUFGTqDYSowZ15zdqBUtuWzU1nB/SpMYjcUqAja8OO4k/3DCkDD4mzx8P29eS3fc1/A
 mK/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732208791; x=1732813591;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KPkgZb+7aZINgr5AlSQc2tvBZSl4x/+JOpQj7wrbfcA=;
 b=HwPKSeywAQrKn0kRlXuAjVptFioyX8N03kbREam42E20NekpwTffALeOKp4SDZY49p
 dnNAJ5Y6Av0LsV/+gI3vcEm9joBbsVhcDdlTuyCiFITDLL+qZFBQfm/cOnqDD/uoabtK
 I4Ve8BwjaXi7tMJ4JF/nMKKBpp1xKW7Pg3xg1BRtapV7X9uRaHWdHL4Wmal/tZhtd0tT
 NPAH6qtULRpxDSSIza6lyFrHVRDy+zPj+9bbt7DzP/Ot+ySFfGV9wIgOCGQ3uX+VAuVA
 ukE1UYV4DYswcuiklBHm2OqO9CfmwnBM1gGLOpxAaKUOjJQe4Ryi+DfyTGT9b7oW57+t
 PwpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxth1J8/GTfOmECj74ST2wiqujjXmIXQ3m6ASKmb5tr7eMP6GKGdAgoeBhZSXnOIl0bdsPre6auek=@nongnu.org
X-Gm-Message-State: AOJu0YzyMLcGZLwdKqXAqKuxB4+w5n2ncQZmbKtezNc8nU+RX2S7VtL9
 8csAjJeHVH7HKxKfY/CC2loYMLYODn+367ZMEYVbUbFOe65jOlkOFdV+6H+MuJg=
X-Gm-Gg: ASbGncvQLJrQUwTpmD/UrzKSAxSlCdvdyleIaGlfyVyxQPgzJe8WD3tmeV1k60+OEMz
 Vupem9VdpDY8D1sCwe10Z5EntoRN5u48SuwWHUTl80ESO+XfMGmPKjcfvc/TEGScAyOYbvkXnO8
 wBC8sCCYGRUcfrkuAVF3KGHMAYUkBuTen74sVtr16dgG+GFQkHTf9Hd4SqoqdiG24UFDLIJRX+1
 1MknN8phW0SpK27pZHKkW4N9UjoXi1ej4HLOqmhsuyZOY21
X-Google-Smtp-Source: AGHT+IEqDY3AjBIogS78NyhIx+DW3tofme1nMDKHwlWuOVklANSLC1tQGFD0PhjFw4UFPjuYuu65RA==
X-Received: by 2002:a05:6000:184f:b0:382:3f77:8584 with SMTP id
 ffacd0b85a97d-38254afa9b6mr7159340f8f.32.1732208790548; 
 Thu, 21 Nov 2024 09:06:30 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fad60e5sm58019f8f.3.2024.11.21.09.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 09:06:28 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B35956045B;
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
Subject: [PATCH 25/39] tests/functional: update the mips32el tuxrun tests
Date: Thu, 21 Nov 2024 16:57:52 +0000
Message-Id: <20241121165806.476008-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
X-List-Received-Date: Thu, 21 Nov 2024 17:07:01 -0000

Now there are new upto date images available we should update to them.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Anders Roxell <anders.roxell@linaro.org>
---
 tests/functional/test_mipsel_tuxrun.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/functional/test_mipsel_tuxrun.py b/tests/functional/test_mipsel_tuxrun.py
index 2965bbd913..d4b39baab5 100755
--- a/tests/functional/test_mipsel_tuxrun.py
+++ b/tests/functional/test_mipsel_tuxrun.py
@@ -17,11 +17,11 @@
 class TuxRunMipsELTest(TuxRunBaselineTest):
 
     ASSET_MIPSEL_KERNEL = Asset(
-        'https://storage.tuxboot.com/20230331/mips32el/vmlinux',
-        '8573867c68a8443db8de6d08bb33fb291c189ca2ca671471d3973a3e712096a3')
+        'https://storage.tuxboot.com/buildroot/20241119/mips32el/vmlinux',
+        '660dd8c7a6ca7a32d37b4e6348865532ab0edb66802e8cc07869338444cf4929')
     ASSET_MIPSEL_ROOTFS = Asset(
-        'https://storage.tuxboot.com/20230331/mips32el/rootfs.ext4.zst',
-        'e799768e289fd69209c21f4dacffa11baea7543d5db101e8ce27e3bc2c41d90e')
+        'https://storage.tuxboot.com/buildroot/20241119/mips32el/rootfs.ext4.zst',
+        'c5d69542bcaed54a4f34671671eb4be5c608ee02671d4d0436544367816a73b1')
 
     def test_mips32el(self):
         self.set_machine('malta')
-- 
2.39.5


