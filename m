Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1texde-0003tJ-6p
	for mharc-qemu-rust@gnu.org; Mon, 03 Feb 2025 09:41:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1texdX-0003ml-9W
 for qemu-rust@nongnu.org; Mon, 03 Feb 2025 09:41:19 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1texdF-0002Rz-ME
 for qemu-rust@nongnu.org; Mon, 03 Feb 2025 09:41:18 -0500
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aa68b513abcso792566866b.0
 for <qemu-rust@nongnu.org>; Mon, 03 Feb 2025 06:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738593660; x=1739198460; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M1O482OJIh050UUseeR+bYA6QoGKKDZRGYOAk/RFThQ=;
 b=ZIgKeMFbhbW4z/mtbAu8u2zY1rb+fKzdkxh79pY3Q+WAvCOBZckbdYzoOd+HCwCkPV
 QSmYXn+o9aspZAqFhflXdU5rHo2O5Ffx7suQnmMzp/LJJ8U71269l3tYn8AE1sZDHYql
 45kFFSnDZhJTjszzUhsqG1K9vCmFWv5jqTxRCQjZtin50pwYCIquNhc74IJz4W4XW/ef
 MYRhbKL+rRYvIvsXRuGVJHzmW/J0WEqZm79fv0XNmtgee0WftZce08JMhOS5Xia8qGs1
 +uob1GzxHR+LXHv16De5ZhyYAyTM9tLPcD+8gi6ai9Ck31+I6D/p/FUhzyrqHFMQXtDb
 AKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738593660; x=1739198460;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M1O482OJIh050UUseeR+bYA6QoGKKDZRGYOAk/RFThQ=;
 b=YEhtxGam3w2DeTTEJDQJUNgmwXAq9yo+jcIkjygn3/lwgz0qigK6YlC9b92Rj/fpuz
 7OkEPoWplMDAMSnvHl30/V4qbdQbeYYcZ90BIlBiJOzGW5RMhtGXS8Nd6qTXDhdsvcQS
 jlS8n+ySs8HesmhLs8lIqC5V6I2iuWHNmQ7X56EupGEvdSPrtDeHzpOCyC6AQ8xXVWJy
 WZMUZa1XV1o02AH+PZZOnDz1K4NuqjKE1p4SgmlITiqVt5HU+XO52AFMLAmhL7mXgslg
 tQDANKA1NHpoz4RdIQxYewZoPtQ83SG9XRQd2SIa8+AqMy1KDNMy2hUlKcNmfcSOGZOe
 AOsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWr4pqFmdfE+lIF6T9JWD//4wKm5A0Ouf1SfE7wNj7SjwHNRj0Tqof6jwMFq5AIMYtm6xtMdKNhcVI=@nongnu.org
X-Gm-Message-State: AOJu0YxE6PlNdVRKBTLsS8Jyw27e9KpPuvULdpremEWnDA8Zmyjq85qw
 PUkgj3mcPj3jCz+iva30mZyBNURbXz6n1csJpK4kacDI8YONoe5R0nzKN1ceTR0=
X-Gm-Gg: ASbGncsa45KPqws+ehbF6epHW7oKG9VqYcbGGXy9oYUCjI39Fbx9LpFtww6vITQfinJ
 n1+u4Ap38fM50Tn9xdqvr9lol9kV/hq7UlWxfh/gFWExVRpTQgB6Kzp5UaTv8F7f0gBNOX1NlUZ
 PorY6A3z7Dyz/53wjZYdD5AhjEqOCuW7QYdFrE7ALpPo4RYvDK/zDzNIu3dZIlDD/JgdMSQugrv
 YEZkrNNxB5B4rWo3Z6qmSJZfXIX4oQFJNeRQyauE4U63kTEQfZ+SKceZZufE3TeMLZLpgmXOnsC
 d88WsADJs8NAUWiWzw==
X-Google-Smtp-Source: AGHT+IGab3SCD85uoPPmeDJwS01muUZc175e7mJc3sQGYUDW3fAkncK2Pzl1jNLZMtqCfhZXqxt+rQ==
X-Received: by 2002:a17:906:478a:b0:aa6:94c0:f753 with SMTP id
 a640c23a62f3a-ab6cfd096f9mr2288818066b.33.1738593660035; 
 Mon, 03 Feb 2025 06:41:00 -0800 (PST)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e4a5621bsm779576466b.172.2025.02.03.06.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 06:40:57 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 1DBCA60BD2;
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
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 14/18] osdep: Introduce qemu_kill_thread()
Date: Mon,  3 Feb 2025 14:40:44 +0000
Message-Id: <20250203144048.2131117-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250203144048.2131117-1-alex.bennee@linaro.org>
References: <20250203144048.2131117-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62b.google.com
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
X-List-Received-Date: Mon, 03 Feb 2025 14:41:20 -0000

From: Ilya Leoshkevich <iii@linux.ibm.com>

Add a function for sending signals to individual threads. It does not make
sense on Windows, so do not provide an implementation, so that if someone
uses it by accident, they will get a linker error.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20250117001542.8290-6-iii@linux.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/osdep.h |  9 +++++++++
 util/oslib-posix.c   | 15 +++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 112ebdff21..4397a90680 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -631,6 +631,15 @@ bool qemu_write_pidfile(const char *pidfile, Error **errp);
 
 int qemu_get_thread_id(void);
 
+/**
+ * qemu_kill_thread:
+ * @tid: thread id.
+ * @sig: host signal.
+ *
+ * Send @sig to one of QEMU's own threads with identifier @tid.
+ */
+int qemu_kill_thread(int tid, int sig);
+
 #ifndef CONFIG_IOVEC
 struct iovec {
     void *iov_base;
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 2bb34dade3..a697c602c6 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -111,6 +111,21 @@ int qemu_get_thread_id(void)
 #endif
 }
 
+int qemu_kill_thread(int tid, int sig)
+{
+#if defined(__linux__)
+    return syscall(__NR_tgkill, getpid(), tid, sig);
+#elif defined(__FreeBSD__)
+    return thr_kill2(getpid(), tid, sig);
+#elif defined(__NetBSD__)
+    return _lwp_kill(tid, sig);
+#elif defined(__OpenBSD__)
+    return thrkill(tid, sig, NULL);
+#else
+    return kill(tid, sig);
+#endif
+}
+
 int qemu_daemon(int nochdir, int noclose)
 {
     return daemon(nochdir, noclose);
-- 
2.39.5


