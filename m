Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tEAVl-0004lE-4p
	for mharc-qemu-rust@gnu.org; Thu, 21 Nov 2024 11:58:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVe-0004dR-K1
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 11:58:26 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVR-00080U-VG
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 11:58:24 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43159c9f617so8987555e9.2
 for <qemu-rust@nongnu.org>; Thu, 21 Nov 2024 08:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732208292; x=1732813092; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dp3O7OQ3MnV8QkUA7aQUHJMfCFG23foe3+ZfbczUD2I=;
 b=qjPbzcrJqARFYgAJ6NjiJ/gasr8RR2l6p+Q+qWsKaMdFb3NRwi7BFEc5ybPYULBqTM
 suoE8rVlrj9BbPg90XZmrn0X/z8A7xML/A8ywmLxxLYdF85IuSayhbWRR0NLRNl6pbJy
 99eRQnsfqJtmBUPCm68OOvcbGY1vqSnN3GpPaNJ0I7EEFTR38RgN6zg04GAWlMNuPaqv
 mR7jMMzPRYAxxPcP3iXlGXLVFPTTHphtaaMk6fGVvjt4T74EOWd2TLU2EISvobhYlc7M
 kYQ32h56KywLhO0TIvEJC81ybpDi08SwWwF2TO+ZOLHmKLg9pioh9V8Xau+SLv+6T3xL
 /asg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732208292; x=1732813092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dp3O7OQ3MnV8QkUA7aQUHJMfCFG23foe3+ZfbczUD2I=;
 b=TOSQoRd5h+JR7AVendg9vEeXngAJ7JeG74pJ03y0M6C8kPaLcSfCh/GNUvTOGniDNf
 8hd90SmUBz23dpt+Iu5zHPyqZPOaVpf2o2tWBz3BWIjldWy+t4dEJOsOxKLe0CNeNzLS
 hmb8Z0tKpj4H8kNtGJXM/N8mgr3Eyw7+/QurOpzkfHvmPjNdXxPGUmXkZAZsu6hnDPDM
 Hx+jceaMEoB2vZNMtUNLL4ljJ2P/irM0c4J9Oh1KRSu2CSlPyscXmotMfMRaGMYSMe4c
 9O4W51CkY49Zv7KN31YYZBDCh6K6tK6xWxXhh1C7IQ3f3BuueVBOqxTWVyVqLDx8BXVK
 peVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCmvSC7mnfmULQl4iS9+7GDiArCsUnylfUGyRuNZjC66oPBB1zLfWqyY/PnxqCGT7MapbPH3AebII=@nongnu.org
X-Gm-Message-State: AOJu0YwJrsMWISuuAPUaaui+B7VJ3Uo3Ga66tJggm0Hz8rJZh/qPgItq
 R/OeJEZ7AfxW6Emd2/QwMMhlak6Qk7DOH0xxPSJ7Aect3NOZdS8pBGS7LMKSF8I=
X-Gm-Gg: ASbGncteE+Gsp4yNy6TIPlFhy8VntgsgAZ1zk9qC+ay1M1kSFk1Mv2KbjscMZP3YNY/
 VIDrB9HUY8I70qVvorenpnlXnlwKk3bmfbJrPL6RMukVUKckPnEvmRl/v4dgwq/Rub3kUWKkmoU
 0cOMxiEl2bAddNiV//th+Lt9ky1AUxlWDmu7nzdLSzyuUIxSRt4iARbr6XPlE/XZG9ZteL2fj3S
 f50UqcbrevVNHVIXYz+oqKdMwtJSByMyvgQSni7l28hdBrr
X-Google-Smtp-Source: AGHT+IGuvjZ8B9pJ41YHj38dXxQihGEDFw8gT3+C8/s8S7wFGUizL5bTtIJgpGfbzxxGthdi6YweUA==
X-Received: by 2002:a05:600c:3507:b0:42c:de2f:da27 with SMTP id
 5b1f17b1804b1-433489869ccmr71250345e9.2.1732208292149; 
 Thu, 21 Nov 2024 08:58:12 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433b4616fc2sm61385585e9.22.2024.11.21.08.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 08:58:10 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 1C1525FC6C;
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
Subject: [PATCH 07/39] tests/functional: remove comments talking about avocado
Date: Thu, 21 Nov 2024 16:57:34 +0000
Message-Id: <20241121165806.476008-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
X-List-Received-Date: Thu, 21 Nov 2024 16:58:26 -0000

From: Daniel P. Berrangé <berrange@redhat.com>

The first comment is still relevant but should talk about our own test
harness instead. The second comment adds no value over reading the code
and can be removed.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20241121154218.1423005-8-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/test_acpi_bits.py | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/tests/functional/test_acpi_bits.py b/tests/functional/test_acpi_bits.py
index ee40647d5b..4c192d95cc 100755
--- a/tests/functional/test_acpi_bits.py
+++ b/tests/functional/test_acpi_bits.py
@@ -196,11 +196,12 @@ def copy_test_scripts(self):
         for filename in os.listdir(bits_test_dir):
             if os.path.isfile(os.path.join(bits_test_dir, filename)) and \
                filename.endswith('.py2'):
-                # all test scripts are named with extension .py2 so that
-                # avocado does not try to load them. These scripts are
-                # written for python 2.7 not python 3 and hence if avocado
-                # loaded them, it would complain about python 3 specific
-                # syntaxes.
+                # All test scripts are named with extension .py2 so that
+                # they are not run by accident.
+                #
+                # These scripts are intended to run inside the test VM
+                # and are written for python 2.7 not python 3, hence
+                # would cause syntax errors if loaded ouside the VM.
                 newfilename = os.path.splitext(filename)[0] + '.py'
                 shutil.copy2(os.path.join(bits_test_dir, filename),
                              os.path.join(target_test_dir, newfilename))
@@ -399,8 +400,6 @@ def test_acpi_smbios_bits(self):
 
         # biosbits has been configured to run all the specified test suites
         # in batch mode and then automatically initiate a vm shutdown.
-        # Set timeout to BITS_TIMEOUT for SHUTDOWN event from bits VM at par
-        # with the avocado test timeout.
         self._vm.event_wait('SHUTDOWN', timeout=BITS_TIMEOUT)
         self._vm.wait(timeout=None)
         self.logger.debug("Checking console output ...")
-- 
2.39.5


