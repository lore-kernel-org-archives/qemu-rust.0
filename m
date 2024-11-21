Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tEAWU-0005rG-79
	for mharc-qemu-rust@gnu.org; Thu, 21 Nov 2024 11:59:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVw-0004v1-Fz
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 11:58:50 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVZ-00087B-Cg
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 11:58:43 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43163667f0eso9780205e9.0
 for <qemu-rust@nongnu.org>; Thu, 21 Nov 2024 08:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732208299; x=1732813099; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oVOduFNiYSGefBbOFbS+1jp6t89niUE1m09Jm4dirSI=;
 b=j2ySktE1jhYo1R8NzQMO4dm2OzZm2KTAdM9jfyCOe8cKF7rQrGpQG4b8aWX41shvYt
 f/sFweJzT1VBlyWXLOjes1bfl7Fx2dS93GgwcZLg3Akfrd4+8g/NxfdabipKeT7fkF50
 uUBcBX+C7My1SRDdIH252sLWNFJTaRSeOMa4nf3B3A+1l0gnrMdgJ4kaj5VMecBT4aHf
 0LQV5U2zMOu2OKypbqogu3Bl9e4/BMkZ8Axt451/nQ7uG8TFQmwimAicA0IkJi/kNqvc
 M4x31jr0rdQlrZ4esraNI7VzbaknHS0Hzxr8RXUYSpoy5EdYmNdmUF2UhuZD1pPHUjdO
 H6Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732208299; x=1732813099;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oVOduFNiYSGefBbOFbS+1jp6t89niUE1m09Jm4dirSI=;
 b=n5i0YntqFeQaLEWtzGsd5tfZaNywizxZTzs/nMpvRN1p0pxbbVpYjpF1BELZN3r2MZ
 3qJv0jyQvueGUNQqIEFxxiIO22DC12Iawx4GaZIkQcHLKz7ZPoKunIjVN7gTX/UYVfE2
 tGD18ovRNuiFPSvyemfOSB82m4FOgJjONXWME9hRNrZ+zkViQM+Bd2GNq8bAvgfxFhYU
 ifpeoFHcwq4Wwz9TOKdg9pkuS3SIWqAQWFeWX7p1L4BkmW3YAuqRm4q5NjbEWDskGgbh
 +HZUAmJYCup4IrDxmRvDCVMY2oX17Ti3OPF+PggRZcDNyq34CKINcp9JlJSYUZOc8qVA
 1UNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMXYZD/8MNPAlMn0B5Vosl+puY2TG4MdGuXJ477akIH6VWy5hMZEl3BAS1UlqWN8JufDY1UKDMIm4=@nongnu.org
X-Gm-Message-State: AOJu0YzDPDlOvwFeLzzX21v0izdsmUZN/eIYQ2julR1JmU8b2lKbratw
 RKoAXHIoY3JspSbFSxDR8BQvPLSNlp8lnh5umtxPNWt/jT1ce/zI5hzkoktzPIM=
X-Gm-Gg: ASbGncswdwXAHcvibIbwruhUfX0kTuP2rBlj0z08neVaaTH/hmyVnBU11ij58p0aw7S
 BIsuQ2Vg6cN+YsPTMo/4CkjWPt3mojs5N00N1pp9IVUTzpelAoS5Ko89qrdI1s1xpCKv7QrCTLQ
 cTMf0QA98lc4TXidm/AJc/Dz1JxVjdK1FqaoS+eyDpTCzpkAqfdOy+odqdWXMgq9RJhrQfMiCzx
 VqrgtPmJkySTVnPQODBKuzKbpwkOjNct42IqhKcZp8podc1
X-Google-Smtp-Source: AGHT+IGaNoTenMq4yd1trvHnQqdRzPi72130iVE6sq2mK9vKa8Jgd3GGN9F4ActKhbIdPkEo0s+NwA==
X-Received: by 2002:a05:600c:a06:b0:42f:8fcd:486c with SMTP id
 5b1f17b1804b1-4334f02a5f5mr59380005e9.33.1732208299513; 
 Thu, 21 Nov 2024 08:58:19 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433b45bd4d1sm63017515e9.12.2024.11.21.08.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 08:58:18 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 8C376604CC;
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
 Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH 34/39] tests/functional: update the x86_64 tuxrun tests
Date: Thu, 21 Nov 2024 16:58:01 +0000
Message-Id: <20241121165806.476008-35-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
X-List-Received-Date: Thu, 21 Nov 2024 16:58:52 -0000

Now there are new upto date images available we should update to them.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Anders Roxell <anders.roxell@linaro.org>
---
 tests/functional/test_x86_64_tuxrun.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/functional/test_x86_64_tuxrun.py b/tests/functional/test_x86_64_tuxrun.py
index 4f96139871..fcbc62b1b0 100755
--- a/tests/functional/test_x86_64_tuxrun.py
+++ b/tests/functional/test_x86_64_tuxrun.py
@@ -17,11 +17,11 @@
 class TuxRunX86Test(TuxRunBaselineTest):
 
     ASSET_X86_64_KERNEL = Asset(
-        'https://storage.tuxboot.com/20230331/x86_64/bzImage',
-        '2bc7480a669ee9b6b82500a236aba0c54233debe98cb968268fa230f52f03461')
+        'https://storage.tuxboot.com/buildroot/20241119/x86_64/bzImage',
+        'f57bfc6553bcd6e0a54aab86095bf642b33b5571d14e3af1731b18c87ed5aef8')
     ASSET_X86_64_ROOTFS = Asset(
-        'https://storage.tuxboot.com/20230331/x86_64/rootfs.ext4.zst',
-        'b72ac729769b8f51c6dffb221113c9a063c774dbe1d66af30eb593c4e9999b4b')
+        'https://storage.tuxboot.com/buildroot/20241119/x86_64/rootfs.ext4.zst',
+        '4b8b2a99117519c5290e1202cb36eb6c7aaba92b357b5160f5970cf5fb78a751')
 
     def test_x86_64(self):
         self.set_machine('q35')
-- 
2.39.5


