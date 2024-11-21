Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tEAVe-0004cY-Ak
	for mharc-qemu-rust@gnu.org; Thu, 21 Nov 2024 11:58:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVZ-0004Wu-5g
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 11:58:22 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVQ-0007zM-Dx
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 11:58:20 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3822ec43fb0so846897f8f.3
 for <qemu-rust@nongnu.org>; Thu, 21 Nov 2024 08:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732208291; x=1732813091; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lPIFW+MIDvbZvhF0n5YdU4sfYa070860/v3aIWKALYk=;
 b=SLKr4RkFcLb2obpzzxC7+3N7f1KG4Y5OwUynXwd4cCsHXAqhEUc6AirO3tHicsTn7J
 FNmNc3OOHxyFer8PNL3kNPTNlYG4D+SnSq9UDjn3Q9Oxx0v+JE9FzDGEPlhvdmbRhcRu
 V3Zm7+4vFnZ+TxJdU/Z6HjahlOVAZYMjiKTt7NQsxkIHyLGb6rrIgAtjaWhqFqSxg/m8
 rq/5G8GjfzADoRZ+RLiSCMxIg9Z+mFqbVWslVSPrkzSd9o/x1D5RZQvTkNJkm6XzkoEz
 ZQNLoeIJI1rd9oS107yRTM48CJhbSIgbNzbpOcbSfDlQaqCZ/9bEqJHrKR6Sgb/Q3GQT
 c/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732208291; x=1732813091;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lPIFW+MIDvbZvhF0n5YdU4sfYa070860/v3aIWKALYk=;
 b=NM9Pg7vcrhv50ikc7tJiOPoPvb3yFAWFEUYLIfdSoUGKZbs5xCx/q6UXyJVWO/8XGf
 nGGRg/fuXuJS03tHsyK3ruEKqzxvPuKUgeEFaCoPIXKCVxdmKZIHSDP+u5lh5G7i1XGE
 jexitpHRFlpWNdDpyepZkxztxpnUjLhQr9Kt++7ObLDeta6atuSPC4P7rocAg7T1Nx/M
 aCcswpH/cTylsG/0Ie2G3Yquga7d68t9lu5xk546FF2EtwVc+IyMvRTTNQFjvrotJlJD
 APvb9PdFXVXQw1wu0xx/pMYgNGfWoOPqcjp/zISEkXsnwtbOJqv7+LqHnCJDsPDtJQQW
 9VaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZCXlqJNrFTKCPSgM6YZlm4sYQXgzE2xc6SPzQFzWsWargprT/44c/UgGCRY3pPH46tMhMsBfRk6A=@nongnu.org
X-Gm-Message-State: AOJu0YxK2XBPp9k0vti9O0BkyoIqrE9dNvWz58szhI+RnXO7H+vW9ToN
 lhue6NQSM4Lc/Y5yvzbmXwbAyB8GHjKcKI9pX7VUNzJBQOEX2BJKOpzpRPl55Cg=
X-Gm-Gg: ASbGncvLBNWf93QRZ9SqWvPoPCuoq3lA/19nQUvg1fMtS4dcAuzPdh/A/tiBbb6WvBi
 LVpDjL66iO7ShBEkhQ55M6U/eUjVFAF91tEQZMW1PZoO6x14UJFUeBMA1TdPyYxG25DcUf5KNxL
 RFIMSiapbp6hzyER8bu1ZGq+j/R9MSE2xmBBBe4TYJmfOUfPVyMJGOoqD0YHSl2ZgXTmgfCeio+
 ofTV0CZJCMSmcQn1n2PnZ9hf/Jddi6elf1xoMlFS3dHqRzW
X-Google-Smtp-Source: AGHT+IERjNcVY63Esz+m5ARC9qYMkrCrcDvhBkmECN98q+XaP8RU1AK9ROyMkEw7IhAPD3KpHAn5ZQ==
X-Received: by 2002:a05:6000:154e:b0:382:542d:39ab with SMTP id
 ffacd0b85a97d-38254adf714mr6452872f8f.3.1732208290915; 
 Thu, 21 Nov 2024 08:58:10 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fbc38afsm17867f8f.67.2024.11.21.08.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 08:58:08 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id C8B1F5FA88;
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
Subject: [PATCH 04/39] tests/functional: remove todo wrt avocado.utils.wait_for
Date: Thu, 21 Nov 2024 16:57:31 +0000
Message-Id: <20241121165806.476008-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
X-List-Received-Date: Thu, 21 Nov 2024 16:58:22 -0000

From: Daniel P. Berrangé <berrange@redhat.com>

We're not using avocado anymore, so while the TODO item is still
relevant, suggesting use of avocado.utils is not.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20241121154218.1423005-5-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/test_m68k_nextcube.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/functional/test_m68k_nextcube.py b/tests/functional/test_m68k_nextcube.py
index 89385a134a..0124622c40 100755
--- a/tests/functional/test_m68k_nextcube.py
+++ b/tests/functional/test_m68k_nextcube.py
@@ -37,8 +37,7 @@ def check_bootrom_framebuffer(self, screenshot_path):
         self.vm.launch()
 
         self.log.info('VM launched, waiting for display')
-        # TODO: Use avocado.utils.wait.wait_for to catch the
-        #       'displaysurface_create 1120x832' trace-event.
+        # TODO: wait for the 'displaysurface_create 1120x832' trace-event.
         time.sleep(2)
 
         self.vm.cmd('human-monitor-command',
-- 
2.39.5


