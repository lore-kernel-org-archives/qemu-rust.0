Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tgQKK-00088U-Cq
	for mharc-qemu-rust@gnu.org; Fri, 07 Feb 2025 10:31:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tgQK9-00081L-JG
 for qemu-rust@nongnu.org; Fri, 07 Feb 2025 10:31:22 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tgQK5-0003wu-Fs
 for qemu-rust@nongnu.org; Fri, 07 Feb 2025 10:31:20 -0500
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-aaf3c3c104fso399529166b.1
 for <qemu-rust@nongnu.org>; Fri, 07 Feb 2025 07:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738942274; x=1739547074; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Um1CwtmhdsQHyRWJ4xWo6y2AlcWR+j1kN7yWOVUF0WM=;
 b=LfD4fPp0TZbBGnBQ0dM6TTBLxRPNHtZOFOf5A8B5oqp8yXlj01MtfW7mXSe91PlpM6
 u6W7s5aiY69tIaAgkneDz7QDHskuxOiieTU4ajNLXPPWpAtcQq4XOg9kEfMVTF4v3IVv
 iiWQEKD4OkyrNZsEmB5w0bquGDjleNaCL5a/CwnADK/+NQ9N7SZCTkRDMvXPmuTrB2pG
 QKH5N4KoLBIKoBdxO9pMhmlk4tOu6UccAjDgGq3yM6PAkjhim6wDHiQ9+cc2/dYqKYPe
 KEyCJB58dB5ZSa23KRyvQJ9eApF4aAKtjvAy/+9/vC3C9iYuSxV6FPqRF4CZNZ5/7a6B
 7udg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738942274; x=1739547074;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Um1CwtmhdsQHyRWJ4xWo6y2AlcWR+j1kN7yWOVUF0WM=;
 b=FwKy48k0/KF0M9POCY4EpxtLt7ogVQ0LEOj//NtLhMRelJktYbegVCm15LZXx7aUCV
 ChoMV4L4oH3crH5Fqp6GUMj28Bg4uW1Wzktr3mBHU8V43XwRaIC5Xwtl+v+lBjO71PGK
 BCiWMYKVTFwCNuZJKaxLIypWxPlSCM5x/24lBE2j5J5/5bZLqleQkjXz3ufuJHWDOC0U
 0fgTY6jWhO4UvgUnAKXJw9ER4USfxx/DbeEz8m5c3QLPIkac4HIX7RDC9alNaj0nbMOg
 OczEnpMnaGiMlbkqUo7gq7eaORU2qNpaOIkeLdhC+9Wwgfi3mm/UrD2gjibkaHqHF5za
 jakA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4ewvlADmKvVZuN5mQ2BQmUdXhR655KQiwP8+GTJFTf0I0dqDN1156tR1p0bGLTIlX+UOBc2i/HeQ=@nongnu.org
X-Gm-Message-State: AOJu0YyZGuq33UUrKYZyctAzZmBauN4pdpyXI+Y77HTW88DF2jv+8jg1
 vJaT8fpqD2LOSRD0qY7VVS4W+LZUexbWeQGWBgfDC/fXHT6iBzbCYwAL90Qbkfg=
X-Gm-Gg: ASbGncvx2IEbEP13irBh1xfRq4TsyEKF7jzZWRM7t0P2Fh4OQX4Jcxf8StmM5GPEv9w
 z40U7aCkWX0vA4MXzIl/s1hscJzMZyTF08nTta7CG7A7ZnX6L7G9BUO+zVtv6XpnTjDVrQxR7Ij
 iDPp18AH0BVnw3yBOn/Xd+NyNMXnSTCD4Rooor8QwAf+dIZX57mBIlqmRk0CSicn0Dvl8+qigHy
 v2u3N1A0Vxm0DmEHjdjnHhaAAzDIMMC8SuXp+7u929sySQz3Pq7PMkbfQXHR+kvqFFIzmjideHB
 Lik4qH4BKOgerziXxg==
X-Google-Smtp-Source: AGHT+IElHjFtPVYJA73ULLa7+KgfPOyHampW28+/996bqIedaJsi9vSXndyF9JnqnF8avBEpNO5jIA==
X-Received: by 2002:a17:907:7b06:b0:ab6:eec6:7cab with SMTP id
 a640c23a62f3a-ab789c3ac8amr448973266b.38.1738942273971; 
 Fri, 07 Feb 2025 07:31:13 -0800 (PST)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab781453f04sm205306266b.161.2025.02.07.07.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 07:31:13 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B6FC05FAD2;
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
Subject: [PATCH v2 04/17] tests/qtest: simplify qtest_process_inbuf
Date: Fri,  7 Feb 2025 15:30:59 +0000
Message-Id: <20250207153112.3939799-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250207153112.3939799-1-alex.bennee@linaro.org>
References: <20250207153112.3939799-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62c.google.com
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
X-List-Received-Date: Fri, 07 Feb 2025 15:31:23 -0000

Don't both creating a GString to temporarily hold our qtest command.
Instead do a simpler g_strndup and use autofree to clean up
afterwards.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


