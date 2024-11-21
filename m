Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tEAVV-0004US-SX
	for mharc-qemu-rust@gnu.org; Thu, 21 Nov 2024 11:58:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVT-0004SU-JY
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 11:58:15 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVP-0007xx-3k
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 11:58:15 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4316f3d3c21so9433975e9.3
 for <qemu-rust@nongnu.org>; Thu, 21 Nov 2024 08:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732208289; x=1732813089; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9C+LM+SP4iK6e01k9p7dSlvLPJtgfpCtu4sPK/ZhGgc=;
 b=eMEqRRwtBQOBPz0zt8rcOID41O1JV7wbjLQ9R1iO/rDX13pXs12IO+n3Smafz4LVqB
 q6y3xntBuCOwlN31EnkIkz1XkShTQC3iT6yTsDC9kCV9i4d6mkwqVhCwlcUg2iP68wnw
 BxQrQ5xw0YPD1XuRWzxs+qVhANJ7FSR86KSQLyiOeShUXbfiMsExpTGg9HPz7Hlrd6ZG
 /U0yIxLgexjCPagVDZR8gqz7pu29YH6HWm11/+13r04dZZE2YZUmaJbrnmu/Rf63LSSO
 79olmcw/JPw8YvYYofNEZxmZ/3KFKM8JbU6qOVhBUmXtcNuSJBP/j474Q2ptUgqV1cZK
 eyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732208289; x=1732813089;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9C+LM+SP4iK6e01k9p7dSlvLPJtgfpCtu4sPK/ZhGgc=;
 b=phvfB271+odzX7IqmaMaU1BcWyhL6Cxczwo9Px3NlO02nrPF11ZW+QY3gX2Xpnd0qq
 Sxh7s+IkAc5C7nQwB5XQSkGQqj13pJ52HAswuMRQggcezL/jnXKkl/XtP2UoumPw3kKV
 IaKvT0yOd3sI5HW45xAE8Rm0l5I+FTtiZ18o+19sU1AewmjzXdQZzBJdain6fkn+NSH2
 o6/LHzTDSZ1GYB7/ZVuW+guw7B7Rm/4M82LWIvraProPooIfhviv/CFAeIZNXxS1pKWH
 jyMuQ0Qz77Ws9fU9OGDUz8C+KRXSswR3yARTlCtjpU8v/f9ASeKwe/boHydxqWmGXmJ+
 JKlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWsWd0Hyxh6BIeTJ+plkxD+YVkbCBDYy5ACpQiTRSdfZ9CcrH2MTRI7hVyvG7rpPLsc7YzzA6xKmQ=@nongnu.org
X-Gm-Message-State: AOJu0Yzd4lZamtPTQ2XRNMwdGSTfI5lg+7UUjpz/PQ8i4wpAE5Ze8fVP
 FeCheaCi+/zwTegjZBMUV9SIlkaZgBodC6nl85en1n9Nkwov8mtJGPKPOLcv5gg=
X-Gm-Gg: ASbGncvqVCYUD7hk4vyUPAssB2aZSK/fnea3U4VqCATLYwTfWYfxxXv1yyNZBhl1SMp
 TmWw8ASrwxQzINrVVTNR40QwSyC8tl4eRJG5H/fagRaGNgOkrjfrQy1wSOwXCnwnWyzHydfy295
 hAPrFNBhTbMokwPcOHIoXXFNuSZ93wEh1VwNTJ42qIYNlSfWgWFcnBFFByBpT9dU+FPj12TBuVV
 9vUHNWkxWygWwvAOa12W0STkD1Y/i8IGg7DmIxURcty0Ud2
X-Google-Smtp-Source: AGHT+IEEIlpGRr+7Hhole4+5IKveNY07NLQwR3GFbZFQU1ZK2icw5G7FkyxKEP7Y+VvuxrAKQNViAw==
X-Received: by 2002:a5d:5f8f:0:b0:382:4fa4:e52f with SMTP id
 ffacd0b85a97d-38254ae55b2mr5975518f8f.13.1732208288870; 
 Thu, 21 Nov 2024 08:58:08 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fb27386sm32027f8f.51.2024.11.21.08.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 08:58:08 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B0C2E5F95A;
 Thu, 21 Nov 2024 16:58:06 +0000 (GMT)
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
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 03/39] tests/functional: remove "AVOCADO" from env variable
 name
Date: Thu, 21 Nov 2024 16:57:30 +0000
Message-Id: <20241121165806.476008-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
X-List-Received-Date: Thu, 21 Nov 2024 16:58:15 -0000

From: Daniel P. Berrangé <berrange@redhat.com>

This env variable is a debugging flag to save screendumps in the
mips64el malta tests.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20241121154218.1423005-4-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/test_mips64el_malta.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/functional/test_mips64el_malta.py b/tests/functional/test_mips64el_malta.py
index 24ebcdb9c1..6d1195d362 100755
--- a/tests/functional/test_mips64el_malta.py
+++ b/tests/functional/test_mips64el_malta.py
@@ -159,7 +159,7 @@ def do_test_i6400_framebuffer_logo(self, cpu_cores_count):
         loc = np.where(result >= match_threshold)
         tuxlogo_count = 0
         h, w = tuxlogo_bgr.shape[:2]
-        debug_png = os.getenv('AVOCADO_CV2_SCREENDUMP_PNG_PATH')
+        debug_png = os.getenv('QEMU_TEST_CV2_SCREENDUMP_PNG_PATH')
         for tuxlogo_count, pt in enumerate(zip(*loc[::-1]), start=1):
             logger.debug('found Tux at position (x, y) = %s', pt)
             cv2.rectangle(screendump_bgr, pt,
-- 
2.39.5


