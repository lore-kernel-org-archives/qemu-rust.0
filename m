Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tEAe0-0000z2-IA
	for mharc-qemu-rust@gnu.org; Thu, 21 Nov 2024 12:07:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAdj-0000RU-4J
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 12:06:48 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAdS-0001cD-Ki
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 12:06:46 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3824aef833bso868296f8f.0
 for <qemu-rust@nongnu.org>; Thu, 21 Nov 2024 09:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732208788; x=1732813588; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oX7juP8P3Dz3dam5JbBdnNQ9MZQFT/0pRbnxh9O9VZE=;
 b=AOeE2LaluN/ICVffAKIU064Nj9823lG3+p66XiA+bR6mSsZyDgzvwiRKXTH7CZoaGb
 WKSggR55H6Gf2lh6P0q8SknNqaabevu1LgKayiVTHtD6L3TKv1Jt2fTT3LcC1BoEfE+z
 B9ZOpHuU8v8t/fHFDlPuNU5UbLPVIgmJ9HEP2oYg29MXNsD1SMwoKFzCpLeS2AD0mvTi
 mOqzWODjCd/GY/hwaJKwzORFhzEe+xsxdocz+Efi4fFqVRbXnEBzlwKXJFrKEVY3dO13
 GuX/z03wNvhV1lWdYgjsMZZauyWHgo4ziUzvL7+pleGFNbIJNMw5kkjgkUqUsuPAxo6m
 DMYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732208788; x=1732813588;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oX7juP8P3Dz3dam5JbBdnNQ9MZQFT/0pRbnxh9O9VZE=;
 b=iUG+9nGkKRHWIOvN4/UACULe7CgXComYYPpV7oRd5Nd535dy39OvWGrFON3SFa2NsY
 PMIRrYazXmdEQ+FZ51YtvBE11fwAQAczKWwbRsODiGMyBeoh1ydiNZ9QgpY5/JGuAvb6
 Xbj7VpLF8k47MStsF3y/W57WAfu2lEyzJQbGE1mwQoHLnW0woShmwll3FRFatA6HJAGW
 D9NaAYzMUf3+xfWxdf6KGIBUci+4h19bi+Iytxjt7cbFMuw6SJTV1ZdBvqztxV53Dk7N
 D6uv6J5+3D4OyjpfjGy+05nd1r3cqUETgVjxn5RB8Ku+tp8QAdLLsREQLeutsSr2GZSF
 zxOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKwFyUjSo1wCR18czZ3uePxUNkud7RoeS6MNjvlmoef10VTLlDNjdg7os7UhjAxD+9Z1NOQoV8I6s=@nongnu.org
X-Gm-Message-State: AOJu0YwZaQ5kaX4V96tXiDS5lJCiYzRCLQMjaywdilVFW3CW/OqV01B7
 9pwQdq30kIukUMuyWAs9VS7IymFC79g+6/DVajBIKzAP9GENxrdVegDb9s9sITM=
X-Gm-Gg: ASbGncswkhfpJ9EZ6lQIvOFUG26AgJT3xkGn6ywGQfMUEYTiwLKeWHFrKty5DH34K3i
 SH+QmY2j+8L38pa6tZJHYBZSlCoOXsL23ejPmIOH7YrpXh4pQE6SiRuaDTUIhYxD7M/uMaibr1p
 ewyzM9e7XLY8cun28nOZmALA2X4iwVAHMJvChyDL9MfbKQOVWvybB5hVHnAlfD47U0nDqWZ04w3
 +k3YcRg2sffYOSqwqT6xCHvG665iKCccc8/wLBaU3OWd+ld
X-Google-Smtp-Source: AGHT+IGP6kebeC2LPTZKsaekqtLwTbMwJwKU++AiGWreRNT81i2UAyPKHUX6eLm0bHUzXeFOqlpubg==
X-Received: by 2002:a5d:6c6d:0:b0:382:3afd:125d with SMTP id
 ffacd0b85a97d-38254b0422dmr5944667f8f.34.1732208787943; 
 Thu, 21 Nov 2024 09:06:27 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fad627bsm56549f8f.12.2024.11.21.09.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 09:06:25 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 13BE460406;
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
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 18/39] tests/functional: avoid accessing log_filename on
 earlier failures
Date: Thu, 21 Nov 2024 16:57:45 +0000
Message-Id: <20241121165806.476008-19-alex.bennee@linaro.org>
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
X-List-Received-Date: Thu, 21 Nov 2024 17:06:50 -0000

From: Daniel P. Berrangé <berrange@redhat.com>

If a failure occurs early in the QemuBaseTest constructor, the
'log_filename' object atttribute may not exist yet. This happens
most notably if the QEMU_TEST_QEMU_BINARY is not set. We can't
initialize 'log_filename' earlier as we use the binary to identify
the architecture which is then used to build the path in which the
logs are stored.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20241121154218.1423005-19-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/qemu_test/testcase.py | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/functional/qemu_test/testcase.py b/tests/functional/qemu_test/testcase.py
index fceafb32b0..90ae59eb54 100644
--- a/tests/functional/qemu_test/testcase.py
+++ b/tests/functional/qemu_test/testcase.py
@@ -81,10 +81,12 @@ def main():
         res = unittest.main(module = None, testRunner = tr, exit = False,
                             argv=["__dummy__", path])
         for (test, message) in res.result.errors + res.result.failures:
-            print('More information on ' + test.id() + ' could be found here:'
-                  '\n %s' % test.log_filename, file=sys.stderr)
-            if hasattr(test, 'console_log_name'):
-                print(' %s' % test.console_log_name, file=sys.stderr)
+
+            if hasattr(test, "log_filename"):
+                print('More information on ' + test.id() + ' could be found here:'
+                      '\n %s' % test.log_filename, file=sys.stderr)
+                if hasattr(test, 'console_log_name'):
+                    print(' %s' % test.console_log_name, file=sys.stderr)
         sys.exit(not res.result.wasSuccessful())
 
 
-- 
2.39.5


