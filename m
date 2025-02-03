Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1texdB-0003SI-8c
	for mharc-qemu-rust@gnu.org; Mon, 03 Feb 2025 09:40:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1texd8-0003Qy-VI
 for qemu-rust@nongnu.org; Mon, 03 Feb 2025 09:40:55 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1texd6-0002L8-2O
 for qemu-rust@nongnu.org; Mon, 03 Feb 2025 09:40:54 -0500
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ab2aea81cd8so804135566b.2
 for <qemu-rust@nongnu.org>; Mon, 03 Feb 2025 06:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738593650; x=1739198450; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TgN34HFjNsDM8vD8ylx4YNq6temrMo6Bfwlmv/QI6BI=;
 b=hKyUtqsAaxZxylw6Tv9N84zqnI+wGv6KW8UTkmOrQLZPhczt4k1ItN2iuCMMZl8OMS
 3e3ivfn8ap8zw0ivs9ckq9q5bWleSsfBoOjGhoh8qcrkoGQD4aJoFNous6igCWoHCPmt
 KgInbJG027NUlcs9xu4ULv6ugQV1lHsS8eJLlxTpaGSVIxj9hTV24ah3OMtCMVwn/cTK
 ljL6RjpRWiXKUys9q+RMQ5e0P2GA+6SDcYAYXJzt7O3Mtjobf3XWifNCRxg6LK6cdbXw
 nuYLyrbNLKTwl6Hcgl9lFI+3LX3K7QsESWWsXDOUg5hl62/rjWsNb3DvdSEnZhbtkbfT
 r4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738593650; x=1739198450;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TgN34HFjNsDM8vD8ylx4YNq6temrMo6Bfwlmv/QI6BI=;
 b=VAG7RfFUIr/Bz5GI7oqhY8ubSrwlRFV8ekmYqzFAtRE9pF976nT2ogKTFhoXrpczRt
 iBBkM3E9V4SNU/rl7yqa4EYx23bexRJNvb70ACVopP0ZsGObCmaKYFO9K89fUbHhh3q+
 9yU9WZiJw3tsqPGoE8kqfSif+V/S8J006TqD89XpQM+3ZVKpmcWU7a40NBcrwnrDHS5c
 +hmfgEILOWjGPSf50U1aQ5wF9HhJJjiV9gMOI0N39ajsaJvemzzlJuTQPlJNaYRDML3w
 vhdsIE3bH4L7sbqcb5Jy7COmXaGsebN2e54IgG4QYS87O459yXhfT+C+yuVygDojTfEE
 OuiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzuAvWTg2Zv2ITIt9TKro/q5KlUqotbLom9gT5SMaVC4sYXMz6R9TAP6XxBs0xYcLJny4BoEvIwI4=@nongnu.org
X-Gm-Message-State: AOJu0Yzl7OI9agdswi3N1NE8HK+pFi/a4iaTJeaRSBUdlJZx0m3Ndlx3
 TfTytpTgOAyJi2WfKZGWEAfi7BUWUdYzmTF0HIyGo73alpb/NUlkTacHlKLhZOY=
X-Gm-Gg: ASbGncveOG3Rv2e87CTA/dmY6zNA5pafsHBFCbrdhT6sU5QBYJ4/CM3PHJi6QvT4jJZ
 uTecvuAPx97nNYZV1fxUV9h4UXRuLvSrNjnHCCyvxewwHVMc2nKVeh5RivKB8qThvpFBBKF8k6x
 Iqro4Xe8TuY/Zcbru/3RnoVpWbnBK06/WkkK4Pb2LRalKZ3aMJAEaSU/QGRlH9OkEp6OD76oqB8
 wMzl2ImN/QQsUCS1krb3DR4f8KWTXAUoqQKPOiKIm63AeA0QqB3RJvzWif0DUDBtmga4FxBst9r
 hnQvc8GGEMW8xvLH2Q==
X-Google-Smtp-Source: AGHT+IEcl4zF1C3b5Y37dufNsJusKaOyWNSbjr00HndpAn1u4fiePANdl3YqC8WFb0pLP232jxxpAA==
X-Received: by 2002:a17:907:9452:b0:ab6:f99f:45e0 with SMTP id
 a640c23a62f3a-ab6f99f5410mr1861892366b.37.1738593650045; 
 Mon, 03 Feb 2025 06:40:50 -0800 (PST)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e4a56fbdsm775529966b.179.2025.02.03.06.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 06:40:49 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id DA0415FA5E;
 Mon,  3 Feb 2025 14:40:48 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Hao Wu <wuhaotsh@google.com>, Peter Xu <peterx@redhat.com>,
 Warner Losh <imp@bsdimp.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kyle Evans <kevans@freebsd.org>,
 Laurent Vivier <laurent@vivier.eu>, Riku Voipio <riku.voipio@iki.fi>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-rust@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>,
 qemu-riscv@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 Tyrone Ting <kfting@nuvoton.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, Alexandre Iooss <erdnaxe@crans.org>
Subject: [PATCH 03/18] tests/qtest: don't step clock at start of npcm7xx
 periodic IRQ test
Date: Mon,  3 Feb 2025 14:40:33 +0000
Message-Id: <20250203144048.2131117-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250203144048.2131117-1-alex.bennee@linaro.org>
References: <20250203144048.2131117-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x631.google.com
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
X-List-Received-Date: Mon, 03 Feb 2025 14:40:56 -0000

Until there are timers enabled the semantics of clock_step_next() will
fail. Since d524441a36 (system/qtest: properly feedback results of
clock_[step|set]) we will signal a FAIL if time doesn't advance.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 tests/qtest/npcm7xx_timer-test.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/qtest/npcm7xx_timer-test.c b/tests/qtest/npcm7xx_timer-test.c
index 58f58c2f71..43711049ca 100644
--- a/tests/qtest/npcm7xx_timer-test.c
+++ b/tests/qtest/npcm7xx_timer-test.c
@@ -465,7 +465,6 @@ static void test_periodic_interrupt(gconstpointer test_data)
     int i;
 
     tim_reset(td);
-    clock_step_next();
 
     tim_write_ticr(td, count);
     tim_write_tcsr(td, CEN | IE | MODE_PERIODIC | PRESCALE(ps));
-- 
2.39.5


