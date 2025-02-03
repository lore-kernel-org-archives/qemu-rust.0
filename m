Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1texlS-0000uS-Ad
	for mharc-qemu-rust@gnu.org; Mon, 03 Feb 2025 09:49:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1texlM-0000qP-Ai
 for qemu-rust@nongnu.org; Mon, 03 Feb 2025 09:49:25 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1texlI-0003HE-Af
 for qemu-rust@nongnu.org; Mon, 03 Feb 2025 09:49:24 -0500
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-aaec111762bso375649666b.2
 for <qemu-rust@nongnu.org>; Mon, 03 Feb 2025 06:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738594148; x=1739198948; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nWETF7v5SQvqoJsQUou+WYUPWgAQpGGIidnYpzh2j4Q=;
 b=HNSm6bRdHGDDFxqkp3PlHuInutEPWBEk2K1Hfw+WbHURBlxDRcrnH+3RzDPKWdHb1F
 yWyZU5X/+R1SE65AsZQdIMvQYPJezx4R/3YkrZTl/fKVbX9KbeE3sLmie6ywPjtW27g8
 uFE9TRtiGIKGKj5GpOvoN1uPXwYrFBO5rYqPsj4IKAC1Tmp4xonvbQKgBWSW2K8VjBpy
 XZU+tKVV90FGp1s/Hb+jaf7b8+/l5IAACDaZGXWRpG8vlKuSg5SJ92tWdNvEI0pCJ3Uk
 kE6o1OHLBfjC+zMA1RwB6IwKXWoF+IPCSoJVQBa1j5+lWSU+jS1I5I7aYaG89WOeEwQI
 1iQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738594148; x=1739198948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nWETF7v5SQvqoJsQUou+WYUPWgAQpGGIidnYpzh2j4Q=;
 b=dbGAyRhdgdRZEPzaZVZs83wCms1tnieCh0C5QT/ULU4s8D2hYLp82Gn8pudjWA9BsL
 KIcLUGYq7dhxBji24nGrevQVqjIjf2BwEAJfh8Do+Fom2SjeSIumNam2j8nCl4Wwsgvn
 1ZYcjCR/6a20qQ69C+FnK3bjNnQ1qwscl94A651y2QEFnYUWFoJSRAau2q9j3DiW3Q24
 GBlOV0hilsHkiKjJ5Y8k/LAITuhlv8u+uF5w2ymgrU64C7KTW+XUggrABJJuDay0FFP4
 55BclXtK2PX1Yit9/6LW5QyH48qINxnXP7g06OXZLRgYdQx33zBqHa2dY3xt6HPLfntb
 CxUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+u5ndSzf5DqvKiDSj1xhalU2I3Dpum1HIgVcWLheqUwLOtB4XE7BIi8N2fGwnFbd9MzbZoia0lbY=@nongnu.org
X-Gm-Message-State: AOJu0YzSc4JX14SUtQvgk2Cvt/H26eMS62gy/wQZk1onRUdva2qNDPon
 CWmiBAqWYOuS/VjsfU9O4Au3Z5Z2KcoLoASbQ3ONrGyFWEhcL1Udtj8BiiGBUCY=
X-Gm-Gg: ASbGnctUWCLGuVhN033rw1H5C3cBOaKzcyPuQey+/xEkVp2MnH0SHfUto2BNPOKogVa
 0hu5oZCrLiaPx2h6WI6nUyGHcqnL7DsCOlE9+3YZhNZiV8ifhfm2HzxrQRTjFVq0XFRMos8rii3
 eWfgxhiKcD0hdnBEY4Pvj+DV/LmmDtazG7G74xlRmLimzCLoh78TF5UYImjVcW/yY8DAqvelYnN
 j1SNyG7xITH92G0lVv0jR96PJb98WTDmIcIdrLJ1avhmcJw08WvHLPcuNwLrpsrfB+Vu/EoVf5Q
 mARc57rJ1vlq3dRalA==
X-Google-Smtp-Source: AGHT+IHCBJbspYBJtSHjAYclL3HRGFlq9TESmSXnRpqM9nfvkyXmc3bXADWs6SZLLMr4H9qJqw87bw==
X-Received: by 2002:a17:907:6e92:b0:aae:8be7:ba07 with SMTP id
 a640c23a62f3a-ab6cfcdf5dfmr2398457766b.17.1738594147546; 
 Mon, 03 Feb 2025 06:49:07 -0800 (PST)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7106178ccsm412435466b.9.2025.02.03.06.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 06:49:06 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 8209F60F1B;
 Mon,  3 Feb 2025 14:40:50 +0000 (GMT)
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
 Nicholas Piggin <npiggin@gmail.com>, Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 18/18] plugins: fix -Werror=maybe-uninitialized false-positive
Date: Mon,  3 Feb 2025 14:40:48 +0000
Message-Id: <20250203144048.2131117-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250203144048.2131117-1-alex.bennee@linaro.org>
References: <20250203144048.2131117-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
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
X-List-Received-Date: Mon, 03 Feb 2025 14:49:25 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

../contrib/plugins/cache.c:638:9: error: ‘l2_cache’ may be used uninitialized [-Werror=maybe-uninitialized]
  638 |         append_stats_line(rep, l1_dmem_accesses, l1_dmisses,
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Is a false-positive, since cores > 1, so the variable is set in the
above loop.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-Id: <20250114104820.2613099-1-marcandre.lureau@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/cache.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
index 7baff86860..7cfd3df249 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -603,7 +603,7 @@ static int l2_cmp(gconstpointer a, gconstpointer b)
 static void log_stats(void)
 {
     int i;
-    Cache *icache, *dcache, *l2_cache;
+    Cache *icache, *dcache, *l2_cache = NULL;
 
     g_autoptr(GString) rep = g_string_new("core #, data accesses, data misses,"
                                           " dmiss rate, insn accesses,"
-- 
2.39.5


