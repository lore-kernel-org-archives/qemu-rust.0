Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1texdN-0003fx-Ku
	for mharc-qemu-rust@gnu.org; Mon, 03 Feb 2025 09:41:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1texdE-0003VI-0K
 for qemu-rust@nongnu.org; Mon, 03 Feb 2025 09:41:00 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1texd8-0002Mb-Qj
 for qemu-rust@nongnu.org; Mon, 03 Feb 2025 09:40:59 -0500
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-aaf60d85238so693569966b.0
 for <qemu-rust@nongnu.org>; Mon, 03 Feb 2025 06:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738593653; x=1739198453; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ptvjzIuVDQT2UCn5M7MTp4nlZSIRLqW4pGkuqXQqZnQ=;
 b=PCG01pZjH+glbXe7AkXY6IMASqZiVhqNzQoVuD5Vc5KJpivgFEH2Q5XOHWEpgBMqoc
 iP4emz5Uh2xtCTQGphhNgvaZp2J4VUwZCyulN3gLo/BNqrOzZtCQeHsV5FPSUZNOs2R3
 85NNEIq6Khi6iLfPZjbQo27u9s4wDLrk0LQ6B99ceCVe2y00zVDvR29+tdRCpNzfwNWy
 JiCbyMnSvBebOHSvmXWPzsZ7LFuWuxjj4jCwCxB6mEROYA3xKnA8FAsxsRGEbvO9Cg80
 E4cN0Td9U705qU5iPez+rLZyqhC6z/X1AYVuhYylnKGnBuOKC3Q5FgPTn32GiV1WxGIH
 /+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738593653; x=1739198453;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ptvjzIuVDQT2UCn5M7MTp4nlZSIRLqW4pGkuqXQqZnQ=;
 b=PzOD4JHvqfdh78q/Ik1JIzkhpbNo2jOBndu4apBnuM7q9zXbueYB3Wz+gaVguSgkKX
 N4p9xuv3A5+oNtCZ+XuWVqHlumRrEaiSj5qLI5mxyOTOVZgUoKjaot02GJKG1o4d7wbY
 bs7QuaEQXAl4vidOod+m48lIgsUMZX6V2CdH/z6N6++j+akT9eqNc+8YVzBFKUFwFWfa
 6SOagSAF+5IKzeeqIHYDOFRq4g/zV+0lNRJipuELTN0TJ2DOPeO3RpXJEE9ewFEyaO3r
 VMu/y9oSJAAVN/QIbo8HVZN9ZVxbpMVhkSNXtK+MvB7CC3CmzDOAHr7ooOzBStk2XnVT
 sFjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKhx27+SmIdo4yhfdij5YA3qrZENAurZWrRgwagI8wkEEl+m5K+LG95yUb1kLOF/0nCUiDP2nXOZQ=@nongnu.org
X-Gm-Message-State: AOJu0YwuwD44vhgqostAkPBuHAUTBrh/+PsutPSULWkws25npeKtx6SM
 F2Xm1p07+I0WzvDd4lQe+3HhEdwM4K326STUdyKtPPHFljmsE8xH7uWTqQd/NB4=
X-Gm-Gg: ASbGnctm5wzpyEpB/eulidFPJgshrjQMO1oet639+XxnVUIblVWHOesUGmOtGtdYNgn
 iblas3J7CxM6iOioaCj0M9KsbdI0ymGXG2uObkpPjybhhUoxnZwhiQry/eiBj5n81MO5RJS20Ra
 qap8TGxnxXcPLUsDl6P1A6CJIirvrKfEDNi5zfqArs6C2L+LiTDWgMSYA3OkghlHEa9k2Sz+IJD
 bnCZTyujiO+aLxCnL1pvTdf6bFnrwlSR4YL5zuLiQmDr7Yk4O9Inv017gxVLdFiNRVj9gfVGomr
 sRYUrvaYqajDpPTasQ==
X-Google-Smtp-Source: AGHT+IHF7o4uKiUCRtU+UcxFhGwRawi+LrTe7yh1OzTqOsCnalydGp9O1YmIBbz5LxsQ77i5v+y96g==
X-Received: by 2002:a17:907:8b94:b0:aa6:8a1b:8b84 with SMTP id
 a640c23a62f3a-ab6cfe17745mr2460856666b.57.1738593653070; 
 Mon, 03 Feb 2025 06:40:53 -0800 (PST)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e49ff968sm767111566b.111.2025.02.03.06.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 06:40:49 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id F2AE95FA60;
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
Subject: [PATCH 04/18] tests/qtest: simplify qtest_process_inbuf
Date: Mon,  3 Feb 2025 14:40:34 +0000
Message-Id: <20250203144048.2131117-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250203144048.2131117-1-alex.bennee@linaro.org>
References: <20250203144048.2131117-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x632.google.com
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
X-List-Received-Date: Mon, 03 Feb 2025 14:41:00 -0000

Don't both creating a GString to temporarily hold our qtest command.
Instead do a simpler g_strndup and use autofree to clean up
afterwards.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 system/qtest.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/system/qtest.c b/system/qtest.c
index e68ed0f2a8..bb1efba9fd 100644
--- a/system/qtest.c
+++ b/system/qtest.c
@@ -763,25 +763,21 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
     }
 }
 
+/*
+ * Process as much of @inbuf as we can in newline terminated chunks.
+ * Remove the processed commands from @inbuf as we go.
+ */
 static void qtest_process_inbuf(CharBackend *chr, GString *inbuf)
 {
     char *end;
 
     while ((end = strchr(inbuf->str, '\n')) != NULL) {
-        size_t offset;
-        GString *cmd;
-        gchar **words;
-
-        offset = end - inbuf->str;
+        size_t len = end - inbuf->str;
+        g_autofree char *cmd = g_strndup(inbuf->str, len);
+        g_auto(GStrv) words = g_strsplit(cmd, " ", 0);
 
-        cmd = g_string_new_len(inbuf->str, offset);
-        g_string_erase(inbuf, 0, offset + 1);
-
-        words = g_strsplit(cmd->str, " ", 0);
+        g_string_erase(inbuf, 0, len + 1);
         qtest_process_command(chr, words);
-        g_strfreev(words);
-
-        g_string_free(cmd, TRUE);
     }
 }
 
-- 
2.39.5


