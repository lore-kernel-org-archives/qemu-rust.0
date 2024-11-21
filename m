Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tEAVq-0004o3-U2
	for mharc-qemu-rust@gnu.org; Thu, 21 Nov 2024 11:58:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVe-0004e5-QF
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 11:58:26 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVS-00080w-FR
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 11:58:26 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3823eaad37aso1502834f8f.0
 for <qemu-rust@nongnu.org>; Thu, 21 Nov 2024 08:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732208293; x=1732813093; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YGcTlsR7h0uL9l7JMzB9rSwqOcrfMiHg81PqrjL5LmY=;
 b=xX42+2L8GenXbFOnmeMFRQ6m20v6+DmGPoVE3IClm0GsABI2rvgBi28mUIAeAgfI6K
 pMgBbSL3suh8MaCLO3aD9VayEInpGIFfglWXLwpg5nUiafamuVsll6/gz0UgfEJbV+ka
 Os5rkom0lnkfVyyvHAvdFhqrwpLX/VDhElBrJ40fiyr5agxQFBinfx5ZIpe1UHlwZmzl
 JSLhT3kJ7DFNCxB5/tHEmvhyoX2Jcm7wGCeIXItRL9Fj1IfZ21XLEZtWtRC5WSRlwa6k
 8OSPAtDscwcaZsdMphCQhqNmIyhJAgsstfQqPPw+rDEYWBYBD/y4Nv4psGCtxRyIIjmw
 8Fdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732208293; x=1732813093;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YGcTlsR7h0uL9l7JMzB9rSwqOcrfMiHg81PqrjL5LmY=;
 b=Rj4vgiZduVZhzBtKu8ujuVTQksfFgMY+B/kA5Nu8EsLW9CywEmhXCTcj4FhsbmIVJw
 MeAJ6nYyHiGa92mzr5kP4Fvd2Ep5xus0vhzyq0uxHbcOONxnTj9KD+c6DEUTa0ufa8sX
 w8lvIsFCGn5rzVw7g9He2FTASIuJMzEukb1gO6p4qdJLAK2uquXmNmewbSboH7LfS0w2
 co2DV4I5bEU1a0qdjo4kefVRv6YqZK87xe7nclBCGSWCQRC5E9Lhx7vA5zRw5EbCqYJm
 PkYOvM/EgB6g/QjjUuBBjYEibud5ZkFhE7sScGVLJQe1Q9CVpzLIK41E5hkbPmjbEOgf
 vG/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNcd4o79Kpf2Soo9D28Au9VywUgf6Ek4wFlSdq+rRZS+oa6aF/lJvPbW6Be2XaS/beF1V1Cv8UwY4=@nongnu.org
X-Gm-Message-State: AOJu0YwWIosPTjdGBEtGxfIrcWXPXsqDvEg1pHgxOZPOMF9AG88AGwzJ
 K9uGqPru55JxA8wBEmlmA3Vf65QsvCvoUN4hwpyiIM4xMf3fXjJDEDVn0nh8cz4=
X-Gm-Gg: ASbGncvPKZFQAHOLOHDdnuOUJduAQGLQ3kszeyYFeVyMeaZn20BjNi9MnBEO/vIS9EV
 PC8XYO2sKtnAWm2b9KG4SSCXzAMu7u4R9k/tcw+ScQCqC/e1Z8UjMIYvE5gtAlowRPMXNzIuMJP
 njfmN59lBfjBMz0EsMb8vQDXzAh1IJYK9EVbiSPGbVB9abTqf5akzJtDFbjQc1zhkJrWTfOtmTC
 W4Zgv/8W3/z5oCAmC9h/hpw7ttbCQKkJfb0NFLXvS1ujS6G
X-Google-Smtp-Source: AGHT+IGivVSM4iXmyGe9ts9qo7V/VNyalRyaK/3K4hnRsaWTip+g0uC3+13I9Lc1O5RmotPl3tN/mw==
X-Received: by 2002:a05:6000:184f:b0:382:3210:a965 with SMTP id
 ffacd0b85a97d-38259d4f8dcmr3665940f8f.24.1732208292676; 
 Thu, 21 Nov 2024 08:58:12 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fbedebfsm14660f8f.100.2024.11.21.08.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 08:58:10 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 6426B5FCD7;
 Thu, 21 Nov 2024 16:58:07 +0000 (GMT)
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
Subject: [PATCH 10/39] tests/functional: honour requested test VM name in
 QEMUMachine
Date: Thu, 21 Nov 2024 16:57:37 +0000
Message-Id: <20241121165806.476008-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
X-List-Received-Date: Thu, 21 Nov 2024 16:58:28 -0000

From: Daniel P. Berrangé <berrange@redhat.com>

The functional test case class is going to the trouble of passing
around a machine name, but then fails to give this QEMUMachine. As
a result, QEMUMachine will create a completely random name. Since
log file names match the machine name, this results in log files
accumulating over time.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20241121154218.1423005-11-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/qemu_test/testcase.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/functional/qemu_test/testcase.py b/tests/functional/qemu_test/testcase.py
index ca13af244b..f9c9de1166 100644
--- a/tests/functional/qemu_test/testcase.py
+++ b/tests/functional/qemu_test/testcase.py
@@ -164,6 +164,7 @@ def require_device(self, devicename):
 
     def _new_vm(self, name, *args):
         vm = QEMUMachine(self.qemu_bin,
+                         name=name,
                          base_temp_dir=self.workdir,
                          log_dir=self.logdir)
         self.log.debug('QEMUMachine "%s" created', name)
-- 
2.39.5


