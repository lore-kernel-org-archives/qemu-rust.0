Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tEAWK-0005MF-12
	for mharc-qemu-rust@gnu.org; Thu, 21 Nov 2024 11:59:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVi-0004j5-PJ
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 11:58:31 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVU-00082e-BJ
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 11:58:30 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3825a721ae5so605556f8f.1
 for <qemu-rust@nongnu.org>; Thu, 21 Nov 2024 08:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732208294; x=1732813094; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wHupEt0CMdn1N9WNkjjRD7wPBLmfP5+19fW5G6FBBAc=;
 b=drebOzxZX3rONQbSLx90vr2hsHISTBOz7gP4szoS/Ru020Y+XhIpj/2g7o6Zle1szM
 trXZeo+ZzSC+GFlgO2skbkjrRc19dz4eEMV4UPKdsbo3SaBL8uPNg2fSbb1lDgKYWaUH
 Gb1irWkJepsVBn2pkVUq6ajpe1nAoeYew37rRMSiQcYnO87pYnR9fQYnjZn6GcKB4pnw
 zKNf5NsJj/osubHvWgyodhlY6Dt7sEmaj6Q1hw2RC1ez+hnqsCk5IPIXQ8/WB0S8yqk+
 9i9VfuC5utpOk5+272oj/Lytqqiv2GCHeCAfWYz+kno+x1KMCfcGRb1QNqpupThNT+Fc
 M+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732208294; x=1732813094;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wHupEt0CMdn1N9WNkjjRD7wPBLmfP5+19fW5G6FBBAc=;
 b=qWwkc5fG9Gaepr6KUIn4Y4a/NiXM0Z6QgnEYOldIpJ0ycAcmM+Lg6WKIkc+19Rcxa1
 ibcKRM54h9xtu/h3PpEE+W1zzm7kktrQrxI3bHVW+5NgWNEOgdmXV09Fh9avMxeqQpQg
 8WyfRvU94BwdjhHK1j7aUwWvyFeB1alC1hQDRaJVaNfHOEI2Y8EIo4swC3Khg1ComPJl
 QO00a43XoZLtMGb3cObxH+7RS3FoPG48OGmbBTLclB1+XyxnO+my5qmrAUHrsjz+eT2l
 CmYTRWHUnMU60katDWFV6Ut7ZQIxBpmERze0AxeU5rqDzRI+KndvKEwgKwoPSbBKzJDB
 IEQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/oaneZVlCQugehsw4b9iah2+QeFfx/z8M6ObVevQTXeWd5ugwp8YnlsgdTc3v6sUDdLfDs+4f+kY=@nongnu.org
X-Gm-Message-State: AOJu0Yx6qDPG3v5uOpryafRf8GhHNAicaOFvh8gzwAAerJ1K8QRRbMe1
 Xasu9B8X1/DffCFWRKkW/Hc1g2aByPiCulQIvFf+96FqfndtA6H5C+LAHGl+xks=
X-Gm-Gg: ASbGnctM6BQ2HrJj8S6aYqB+QaJJ2xceqCzfL4VXd8ovAIEmtq7WCCIbr0oHc+OPLtW
 1kHq3lV9XQWG+gWaVXjQuRvP2zzyr2ql7n9pGwwgE3s14e8fpmRiqBFCL9nRfqHreI7VmkGw+SR
 1k/kZxuvkiUBT622q9c3OzvVrwDFn8J78f7UdH0XnMwOTfY98cwgJm2NYV/FQrv5ksDHIULdKTh
 6Y0/ox5s2kG9MiDg4atPSN3bWC5PZwXC6fcPdVvrQdjksR2
X-Google-Smtp-Source: AGHT+IFqv0OwBEVksVVw6Yj8Rp4NvrjsWc0gWEq/D/KDK6XKYqeV7+nrs5NARmd2VuEU1As/xn87zQ==
X-Received: by 2002:a5d:59a3:0:b0:37d:43a8:dee0 with SMTP id
 ffacd0b85a97d-38259d1b10cmr3258327f8f.17.1732208294543; 
 Thu, 21 Nov 2024 08:58:14 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fb30bfdsm30067f8f.56.2024.11.21.08.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 08:58:10 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 4C84E5FC95;
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
Subject: [PATCH 09/39] tests/functional: put QEMUMachine logs in testcase log
 directory
Date: Thu, 21 Nov 2024 16:57:36 +0000
Message-Id: <20241121165806.476008-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
X-List-Received-Date: Thu, 21 Nov 2024 16:58:31 -0000

From: Daniel P. Berrangé <berrange@redhat.com>

We are not passing the 'log_dir' parameter to QEMUMachine, so the
QEMU stdout/err logs are being placed in a temp directory and thus
deleted after execution. This makes them inaccessible as gitlab
CI artifacts.

Pass the testcase log directory path into QEMUMachine to make the
logs persistent.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20241121154218.1423005-10-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/qemu_test/testcase.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/functional/qemu_test/testcase.py b/tests/functional/qemu_test/testcase.py
index b9418e2ac0..ca13af244b 100644
--- a/tests/functional/qemu_test/testcase.py
+++ b/tests/functional/qemu_test/testcase.py
@@ -163,10 +163,11 @@ def require_device(self, devicename):
             self.skipTest('no support for device ' + devicename)
 
     def _new_vm(self, name, *args):
-        vm = QEMUMachine(self.qemu_bin, base_temp_dir=self.workdir)
+        vm = QEMUMachine(self.qemu_bin,
+                         base_temp_dir=self.workdir,
+                         log_dir=self.logdir)
         self.log.debug('QEMUMachine "%s" created', name)
         self.log.debug('QEMUMachine "%s" temp_dir: %s', name, vm.temp_dir)
-        self.log.debug('QEMUMachine "%s" log_dir: %s', name, vm.log_dir)
         if args:
             vm.add_args(*args)
         return vm
-- 
2.39.5


