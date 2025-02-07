Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tgQLN-0000cy-Cr
	for mharc-qemu-rust@gnu.org; Fri, 07 Feb 2025 10:32:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tgQKJ-00087O-Fj
 for qemu-rust@nongnu.org; Fri, 07 Feb 2025 10:31:33 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tgQKA-0003zz-1Z
 for qemu-rust@nongnu.org; Fri, 07 Feb 2025 10:31:30 -0500
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5de56ff9851so378803a12.2
 for <qemu-rust@nongnu.org>; Fri, 07 Feb 2025 07:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738942280; x=1739547080; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XyHIrLgGLhzWXn2IY26JotGt/snZhuH8wc9tGSgEE4k=;
 b=X1b0NquHt1rIGSgOTDLIwVmnCFmHAru0dQynHnPA9OXEeFUvzxH/8MN1q/kcbfu6Rd
 vq+WHDNwZ6tma0BAAXb8/wMxh63e2d7jUWKa/CUhZFiV3M3SuZS9bGIuerbpv+NF0/cm
 NSoXVO1Rfsq/pBCuoTDi64lfncVsCxjFfuF9rjeBD1XzLaGB0SSVPoczjUg/QwRtOKqF
 JmQDeUClCDC4p5OYYY1rkFmb6Wg8ZSLNFWv/0zSikCjRPmFgokyZN18gqbqV1C1YfdUy
 VEI//fq99O8Q65RNCqrlTqbwbfZvtlwHcC/35Ww21cTW4HGIvZMsi14UkyPUI4tbMy7F
 EbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738942280; x=1739547080;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XyHIrLgGLhzWXn2IY26JotGt/snZhuH8wc9tGSgEE4k=;
 b=TpIRjHed5Jkz4xmXw/yTFRVT7CMS3Jww9Ad79YIoM+XCMP9oWjwjOf17oYzzHy2u0K
 doVstARLhmUml6VDGHUP1MYG9vb71ue8DtCyBWrJ13jxSSqzq2k+NpjYJDjVDvUbqwto
 5FejDONzBf2hne+WZVjBYpEFN/JTNYCVfXLysOjdKu0/QTrHn5LptMs1aw6rRFtu/x0B
 Z8EBHkGhG/Sf/YQ2WwuuYAGN1gggbMT/EqeDBelhTdsk4A3wwnEPc/PXBiCG0Srv8J4e
 Ze+mBm4/FmI9al1NlWplMtfi2cxXEcB3XUzfv8wRR4pkcWZVSwRc5iSycAk06iYrwvFi
 fE0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVT1Ly/jrMUl2oPf4hsHdsBJEdwyTQOBCmk4r2aZ9TSo+AbrM3ejXMyxOQDd6J8ICPYKYbZzer7fGs=@nongnu.org
X-Gm-Message-State: AOJu0YxDxxkLBuB741DQECF8sgryDph/0WmnCsu7bqhDpYLtlZkr2YIG
 UJPhhKNzQbRLxfrcCgYG/EoxKRzB6LCmYnLtx6NGSC1pJI0kH9Wch2QU2jSG13s=
X-Gm-Gg: ASbGncsA/SsYIL8bpwND/0UDVfMU+N5qfSveG9+B/b8hx92SsoHCNqzFnelMhEzUccT
 I2ktsWcf694roryyNWQYDkAaK5+TLbJUoVBP2oKfrej3/coYgdM77hrDiddu4qpcjKDUPjsB7VQ
 3AR//+3d9tigqGA2qJ7icHAVl9hwG19aY9+6M04mYJsz5s/M18jYeZFiG+wjnePO2RDRNnmJDgS
 gn/esUifPOC55Zrf9SIym6fpb22MbyN9vqg4Mjx6kn2wO6iIq/BUsbuWPlrrxGUHoggIS5eIL6T
 T6gEG5Hy/9pkXFnigQ==
X-Google-Smtp-Source: AGHT+IEfSV69e8DYUCGC03jbAWedKhxSTpRglbr9TC/MTS1Ma9XcHXuvFhJPnS9wWLWE59msKaO+BA==
X-Received: by 2002:a05:6402:4588:b0:5db:731d:4456 with SMTP id
 4fb4d7f45d1cf-5de45085cc7mr4289105a12.28.1738942280178; 
 Fri, 07 Feb 2025 07:31:20 -0800 (PST)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dcf1b81608sm2621482a12.35.2025.02.07.07.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 07:31:17 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id E35E65FB2E;
 Fri,  7 Feb 2025 15:31:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 qemu-arm@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Bin Meng <bmeng.cn@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Kyle Evans <kevans@freebsd.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Riku Voipio <riku.voipio@iki.fi>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Fabiano Rosas <farosas@suse.de>, Alexandre Iooss <erdnaxe@crans.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Warner Losh <imp@bsdimp.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-rust@nongnu.org,
 qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 06/17] tests/qtest: tighten up the checks on clock_step
Date: Fri,  7 Feb 2025 15:31:01 +0000
Message-Id: <20250207153112.3939799-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250207153112.3939799-1-alex.bennee@linaro.org>
References: <20250207153112.3939799-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52a.google.com
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
X-List-Received-Date: Fri, 07 Feb 2025 15:31:38 -0000

It is invalid to call clock_step with an implied time to step forward
as if no timers are running we won't be able to advance.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

---
v3
  - used Peter's suggested wording
  - used plain old if over ternary operator
---
 system/qtest.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/system/qtest.c b/system/qtest.c
index 28b6fac37c..12152efbcd 100644
--- a/system/qtest.c
+++ b/system/qtest.c
@@ -708,10 +708,19 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         } else {
             ns = qemu_clock_deadline_ns_all(QEMU_CLOCK_VIRTUAL,
                                             QEMU_TIMER_ATTR_ALL);
+            if (ns < 0) {
+                qtest_send(chr, "FAIL "
+                           "cannot advance clock to the next deadline "
+                           "because there is no pending deadline\n");
+                return;
+            }
         }
         new_ns = qemu_clock_advance_virtual_time(old_ns + ns);
-        qtest_sendf(chr, "%s %"PRIi64"\n",
-                    new_ns > old_ns ? "OK" : "FAIL", new_ns);
+        if (new_ns > old_ns) {
+            qtest_sendf(chr, "OK %"PRIi64"\n", new_ns);
+        } else {
+            qtest_sendf(chr, "FAIL could not advance time\n");
+        }
     } else if (strcmp(words[0], "module_load") == 0) {
         Error *local_err = NULL;
         int rv;
-- 
2.39.5


