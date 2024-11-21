Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tEAWU-0005sh-FO
	for mharc-qemu-rust@gnu.org; Thu, 21 Nov 2024 11:59:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVt-0004rj-Ve
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 11:58:43 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVX-000866-JN
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 11:58:40 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-38231e9d518so804802f8f.0
 for <qemu-rust@nongnu.org>; Thu, 21 Nov 2024 08:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732208298; x=1732813098; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GDGZljMa8fdDNeLPb/JcZV7H88cNEUoroqHRVzlN6wI=;
 b=rohxcbDBW0DYKZlWLyDzGVKIuQ6MMatxYhMdZ9wenHZa3gySKPZTQMO6u399LEYA7I
 HR6gQVolW6Rd8BhhBxQ18jlKzOg8pRaHQx6uAWkjvU2uua4D+yGfaktUzAd8inW2Lc+c
 MBV+N2TQIKhi/D8LlJ3/taeldZwHiE0C0rCsoPsgVPJg0khqQczrktQ2CGbf5kJrLCsX
 07LfQ/k99RB2bv18Jw3RXBzg9TesU+KoUKpkyEKeqyuUv4LNqPPnugtqR3E11xhZh8vN
 P151OMmIO06mZWB3wqi3O1+3U2RXgoaf+wZkwzoNZh8VKE8VzJvJZ54pO7UJtIdOQpWH
 tFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732208298; x=1732813098;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GDGZljMa8fdDNeLPb/JcZV7H88cNEUoroqHRVzlN6wI=;
 b=xTaVkixe/PtDgl9f7DnIzJ6JPuEchCFS68ptq4k8OnDgv/NWUjFI/xzRc+2Odi4/nB
 cyqimSBAoe219mhgnFg9sHgOOXa/CRml04tLXM1WCON72nvnk1fYMafE1+2pbHzjDRaD
 37euwt0Z6wXpmxNV1IYnnQT8tycz44nT5SFWukNVXpqKmENSljw5K+cq6+qSFnrm6nMP
 YQcv2Jcip6RCMGNmBGQ/VnRov3e4Jz0pkmwBzczDEiXKc0iEXOI442u81E4D1rshPqW7
 nlHHjonQB1XDn0dvMhNyI7myr7rnBTXVZyqBDM4oShqQ9KI+1VFkO3AbrCfioZeljTY/
 wmjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTWDqDUAU1mxLu4/Zb3vellROVP+ApwUpliD7H4+fZ/FQK5fnzNtx2T3NaJ3FCLSrVfuUFe1gUmxc=@nongnu.org
X-Gm-Message-State: AOJu0YwroEQY+FS/WkrDAxLqDtoM3VOAg8WwnrYAJpVbrsc6jpu8FZaH
 SO+Nfv9WUVJMp8jlYyt0RXZdcGruwYAXNhohbrq8mM7Y5FWMmkgxexbGex5OGrY=
X-Gm-Gg: ASbGncsBuTMI8/46+lc13b3ueTG+Tdju/La0Ufx2UtIoXrXcabPbzSH2H/rz5J4Z2ey
 +VqNpGxM0AJC8RvPTL+qdEkCHMZa65+efC06ee44q9Kt7s655BPK/ij7SVUQu4vG0IBnCrBIk/R
 g50jAWCkgABeljkG6ribAJphDFy9v6pDOi4OlOj5nzYy3hA7cwDZK/OCsBVLKxFq1YDqP/pO+vJ
 XaALlpvge0p1OwZSWYnOGRlcDADN/7mv/oQmBsrwwlo+hj6
X-Google-Smtp-Source: AGHT+IGTm4zZP3yHvIv7woropTBSbw1FfU0E6/kLCFoF4wYpn2LgqVYabzMyVfJtX7GCfjIlZ8vtoA==
X-Received: by 2002:a05:6000:4007:b0:382:4503:7283 with SMTP id
 ffacd0b85a97d-38254adef91mr6740242f8f.9.1732208298110; 
 Thu, 21 Nov 2024 08:58:18 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433b463439esm61337745e9.31.2024.11.21.08.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 08:58:14 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 07F4B5F95A;
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
Subject: [PATCH 28/39] tests/functional: update the ppc32 tuxrun tests
Date: Thu, 21 Nov 2024 16:57:55 +0000
Message-Id: <20241121165806.476008-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 21 Nov 2024 16:58:43 -0000

Now there are new upto date images available we should update to them.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Anders Roxell <anders.roxell@linaro.org>
---
 tests/functional/test_ppc_tuxrun.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/functional/test_ppc_tuxrun.py b/tests/functional/test_ppc_tuxrun.py
index 50b76946c4..5458a7fb71 100755
--- a/tests/functional/test_ppc_tuxrun.py
+++ b/tests/functional/test_ppc_tuxrun.py
@@ -17,11 +17,11 @@
 class TuxRunPPC32Test(TuxRunBaselineTest):
 
     ASSET_PPC32_KERNEL = Asset(
-        'https://storage.tuxboot.com/20230331/ppc32/uImage',
-        '1a68f74b860fda022fb12e03c5efece8c2b8b590d96cca37a8481a3ae0b3f81f')
+        'https://storage.tuxboot.com/buildroot/20241119/ppc32/uImage',
+        'aa5d81deabdb255a318c4bc5ffd6fdd2b5da1ef39f1955dcc35b671d258b68e9')
     ASSET_PPC32_ROOTFS = Asset(
-        'https://storage.tuxboot.com/20230331/ppc32/rootfs.ext4.zst',
-        '8885b9d999cc24d679542a02e9b6aaf48f718f2050ece6b8347074b6ee41dd09')
+        'https://storage.tuxboot.com/buildroot/20241119/ppc32/rootfs.ext4.zst',
+        '67554f830269d6bf53b67c7dd206bcc821e463993d526b1644066fea8117019b')
 
     def test_ppc32(self):
         self.set_machine('ppce500')
-- 
2.39.5


