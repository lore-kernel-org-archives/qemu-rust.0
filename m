Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tEAWI-0005Je-Ok
	for mharc-qemu-rust@gnu.org; Thu, 21 Nov 2024 11:59:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVi-0004iB-Bl
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 11:58:30 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVT-000829-KS
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 11:58:29 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4316cce103dso13217565e9.3
 for <qemu-rust@nongnu.org>; Thu, 21 Nov 2024 08:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732208294; x=1732813094; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HBO8uUfv3fFiWiD+w6s2aaOdqrCx/cKUKIQ69stTmio=;
 b=DwaFEwJl8uXmUrxBuuoIpwShiSd8kLbeCY1SVFRk7Bux1bcVUntwOMcEXK+7cwKj9D
 9x5UN6q96+gBlx43RJFi8XftlTx577QVFC6FGPYGyRral+zlf6vz7wje/AEMBPLMa/Vb
 FMv4G1sGxz/ErofVDB5yC0IkW0rOUGyCj7mqo4tpOAkb3A/8x4Eem9v0GPpJ2Q+bGUjh
 zipKoytRdqIrc2gG5XGaz6huLq3+/HRq0FUpwE0zbcngsTM1Fxi+5dAeWseudRUZAYMt
 y/38NFrxoTX/AddzfcpZv2u9nRy8sQVWrRNMfEfboLqviG2zJL3Hlik33NvkBU5JDo+g
 BMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732208294; x=1732813094;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HBO8uUfv3fFiWiD+w6s2aaOdqrCx/cKUKIQ69stTmio=;
 b=wPxpnA6aj5t1/QhBgOlwgkKDBQnLJCpAiNJ8AZkU+9LHLSosqWJKGkxU2UFjowHbjI
 IKOOrDjZxmVF5lNRfEVepi/K1czPS7sMpxW4GjC61q4b9rN/nTI5xKv5aXAT6IqExUW/
 hZZvOW0tHhECDc9YtesmYrsIIMsF8H2B3VdP/4qadR2HHCEJgWTRMg6WMaHedY7mGtq8
 H12KgiF3zXnUR3g++Y3Y53mGol8QvyRV0+X5V7sdIlknTtTzQOlnzJrLKOPh+fm4kAxC
 o4pPeubszbhBG+zQcGLGishXrlRI4lg1o7iWa6F7ZigyhLuLJTjukZhJY/oCOWWlPsXR
 vxpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMrhwiJ/5/dmzbHeiEudExnp2QkX7cd03csWkdRMwA842DEU5ZlbJuKahnQtGLNHKgyjsaFGlMTG8=@nongnu.org
X-Gm-Message-State: AOJu0YwOF4z/HLOoyUlfOwgahnQQhd0zdxStXjTTsiRmJFG/h7aH3ALB
 lAwH2i2stjqWqMRYEBIUOa2kPcOfhegAIvtjWw/Rm6kesZP/aHWEScgF8y09Pw0=
X-Gm-Gg: ASbGncvqHoFH20NMGKco0nskEV3dB3WvMOYcrk+6ZaIUinqwamKVr/73FiABIpf3GFE
 yE5K2MbXBmbyqTshx280pYPMLxXbepep0jOfnLtSYRncF+8P38vq7FITMQDXeqwe4btH11zkRNu
 tpWYo6illHc1in/QZbpavJwAPj80sBAzrLCAOHA5AxB10y6O9YyiKsg8dN6pVknayT2ZV00YAyr
 xqa955cKgQJsqoQkx2WKlvNMCTyncNv6FF0rIKanP36JkNC
X-Google-Smtp-Source: AGHT+IFluGvXNWin4wGsdyZrYLQC3KI6QlEadKc1ikm2HChlvy4kmoKlcIMmhgumhDHp74vpHncVWg==
X-Received: by 2002:a05:600c:4690:b0:431:5ba1:a520 with SMTP id
 5b1f17b1804b1-4334898172emr85435285e9.3.1732208293966; 
 Thu, 21 Nov 2024 08:58:13 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fbed99dsm7650f8f.94.2024.11.21.08.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 08:58:10 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 04FE25FBE1;
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
Subject: [PATCH 06/39] tests/functional: remove obsolete reference to avocado
 bug
Date: Thu, 21 Nov 2024 16:57:33 +0000
Message-Id: <20241121165806.476008-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
X-List-Received-Date: Thu, 21 Nov 2024 16:58:30 -0000

From: Daniel P. Berrangé <berrange@redhat.com>

Historical bugs in avocado related to zstd support are not relevant to
the code now that it uses QEMU's native test harness.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20241121154218.1423005-7-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/qemu_test/tuxruntest.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/functional/qemu_test/tuxruntest.py b/tests/functional/qemu_test/tuxruntest.py
index f05aa96ad7..ed2b238c92 100644
--- a/tests/functional/qemu_test/tuxruntest.py
+++ b/tests/functional/qemu_test/tuxruntest.py
@@ -39,7 +39,6 @@ def setUp(self):
         super().setUp()
 
         # We need zstd for all the tuxrun tests
-        # See https://github.com/avocado-framework/avocado/issues/5609
         (has_zstd, msg) = has_cmd('zstd')
         if has_zstd is False:
             self.skipTest(msg)
-- 
2.39.5


