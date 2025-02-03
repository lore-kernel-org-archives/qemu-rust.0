Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1texdf-0003w3-Qf
	for mharc-qemu-rust@gnu.org; Mon, 03 Feb 2025 09:41:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1texdI-0003cM-Dr
 for qemu-rust@nongnu.org; Mon, 03 Feb 2025 09:41:04 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1texdA-0002Np-NV
 for qemu-rust@nongnu.org; Mon, 03 Feb 2025 09:41:04 -0500
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5dca4521b95so2786478a12.0
 for <qemu-rust@nongnu.org>; Mon, 03 Feb 2025 06:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738593655; x=1739198455; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rhXT1GZ1FosRrGUDia524QgRgPZ6Dnd20b35E6F9zyk=;
 b=fAM5l5sFMo+ZDLJDneB2DtWyteAByCRX0zM+gtzG3XCFZdVqjiGwICAMoOFJqTpZiV
 CGTNZ+d2Y1jh6J8i6cFK10MeMIfM5IJV8H+3eO/8+6Ll+8H6WO9hsCRDErXGDfB4xyN8
 Ees/KWd9JQPZfTtwxk//YcEMbZ4WSc9W8I5nuiwAc8m/p1cfvLFSF5SANxzHXzet/ZvP
 QJmYqAm/IlJRg9ciUzQSTcsPijKw8KFWZmgNPjVri40GA10/a08PIoQvbLGeVrpFDlJJ
 DX0+KcgJ/ygqqrcV4NmaglLutgPm7hzUjrPgL7zP1T9g08w2LCUKWrRMOHSSjWdmPo8P
 mhNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738593655; x=1739198455;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rhXT1GZ1FosRrGUDia524QgRgPZ6Dnd20b35E6F9zyk=;
 b=U9+b5/hWUUg/ryfp+WxG/Ba22FaI4tJF4ERbcaS6EsHp63UbymmvMteiGCOc6/hQZj
 3fUXutd7dSSYAuF0ltZ0GdN9qquDhgFzuIxDYGSsUBBFuSsNw33EZE8WCkEQLDvi27QN
 Xy0tASh64L+lTNgYTFGtZoLd2txpl38kuz1Hay1nnX0lOavwHAUCSe5T2lxfdGLVGwnQ
 C104jeHCohvgQZOkwji/So+qlokc9AL+CvtVOcGGOt41CMGFjMgTdfcEpLhtS/djvR+b
 0uYtNuGdmYvuoz2rc7Vilzh3lIQC1gy5T3AtamtnDY54vxtsF8l0xudQ4Imlo3/DpYal
 zGjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJR1FcVAct58opRPRcyNS7v+rHVm/EbCYxNCfJGQGT/vw2VpD1TUteym0hdKPKEzIQ2Kf4uF+T6a0=@nongnu.org
X-Gm-Message-State: AOJu0Yw0sETZFJ5pcQuvyEw0Y+cZZCnI0j2zNbxh/p9C8u4rzzqVYQbL
 asu4FZU4/FJofsS6NF8u8KZSPKWv1/rfvJ+wdMx1HSEfM9E2m1R9zAlQJUwGwkU=
X-Gm-Gg: ASbGncu4unaPJFo80hRkpYb2HbHtpvM/EnL4CIWYt/ZEw7XVp8nYaxu7PEez+MAcUii
 H9U2dCYxaMTXC/y2L40Zgd4Ogtbi37eKMQT3mxNYu1rU/4BYUSE5m5AfLPFmkbS3QZo3EJmkBfJ
 zecls0XdnMC2VyZ7FDhg1So5cgk5uKvTLHsUgwJZIbtCn6cKjFCE6Onchw2UIxlC8c0ka06oZAg
 VtjSMAV6Xn8fpV6Lf0Q0rTS4ORq5haMX6Eg0pWg/G9jAX2dycUZNYkJUwoRRyYU+mmKP5OJICbf
 rlG3HIdYZJzZuHfZ8Q==
X-Google-Smtp-Source: AGHT+IEF55yHkBqlJq6QPgVbWxirBkxKNLZQZIiikbn3ExvNE7aVlzu+OAbmA32EhtV11YstLN903Q==
X-Received: by 2002:a05:6402:4406:b0:5d0:81f3:18bc with SMTP id
 4fb4d7f45d1cf-5dc5efa2fb7mr22965907a12.1.1738593654930; 
 Mon, 03 Feb 2025 06:40:54 -0800 (PST)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc723e9fa7sm7741236a12.20.2025.02.03.06.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 06:40:53 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 2EBA05FAD2;
 Mon,  3 Feb 2025 14:40:49 +0000 (GMT)
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
Subject: [PATCH 06/18] tests/qtest: tighten up the checks on clock_step
Date: Mon,  3 Feb 2025 14:40:36 +0000
Message-Id: <20250203144048.2131117-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250203144048.2131117-1-alex.bennee@linaro.org>
References: <20250203144048.2131117-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x532.google.com
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
X-List-Received-Date: Mon, 03 Feb 2025 14:41:04 -0000

It is invalid to call clock_step with an implied time to step forward
as if no timers are running we won't be able to advance.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

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


