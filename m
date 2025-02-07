Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tgQLX-0001Ci-L5
	for mharc-qemu-rust@gnu.org; Fri, 07 Feb 2025 10:32:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tgQKN-00089v-Bz
 for qemu-rust@nongnu.org; Fri, 07 Feb 2025 10:31:38 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tgQKA-00040z-Uh
 for qemu-rust@nongnu.org; Fri, 07 Feb 2025 10:31:34 -0500
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ab795eba976so34856666b.0
 for <qemu-rust@nongnu.org>; Fri, 07 Feb 2025 07:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738942281; x=1739547081; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/577CdB1eWedE91Z4d0PM1VMtk8hOH9rwbGlAE6K9w8=;
 b=T6UsfFjKKjJFChLvwUX2GPsQIuOe3s53L2+jyXysPHsKas9TR8sf5YtKQxRZnn9Eo9
 BU7X6E8T75jU1Uv0LiJN/TbdyI2UiqSz0KcLTdid2QD2b+ttFUoZ/IVNZ57lpr+7+n4I
 LwKn7VS40/lK7kmcZUR8bIgq58j2dP2Y1Z9pCwIl6Utr3dRK8d/ns7KmkzF3wtg2PkVZ
 tYvAoXM+7D3mcYt5u37c4F9BhgfJf2cqFkdP8asIGphQHuYbjSON2HVuKe7wsW2f8ohL
 Jxe9Pqvkbhe+oyUCeYrh5ocaB4NM0W3/15qO3LmD2Vr3qEmXSLkMfKFtlfYIWRkYnoLF
 meJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738942281; x=1739547081;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/577CdB1eWedE91Z4d0PM1VMtk8hOH9rwbGlAE6K9w8=;
 b=biPhXEwMD6GTyxux0CEzxqESEE7T1xu8ZnhrGDfOzkzo78/ojlkxeSw7oydUgFFgNw
 iVmql1Hgb6+LEeMVoBxORyqrPlZIL9epUDJv9uW43PnPBPvlYNp6qXUvdZEOP4KoFO5r
 HoHXBOX374AoSy9O2VRGUYjK0OK4fFrGCLJ6udrkP4Fc1COlX6XXrf2TSOpiF03oPD+P
 rdCk22WeCyKw7Has9ncuBgo/tsNxIjb+t3GKxXQ2l6a3oH4OYFufeVSjd92zO2OxUiXK
 wu+/bPBi1ZXyNsRFDqhYQ6fGau5WQUZnLlx0xj/HbMULvgO1xQlBh/YJV2mpvbaQechB
 CaEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/9xWsstCGKqRWSIC+AgRjgRllLYAcN00awtJ1Ywba733uHlkL9hw1PyYT2yk767igys0yU96xQdc=@nongnu.org
X-Gm-Message-State: AOJu0YyfUmNI+gxFZf8bt6lN3M9Bek7znYXw6qmdmnNn22qt8RWB6eQ6
 E+F/agrb78FKXJ+k0OTq2OKgR2USyAj+8ALrMTZLdUbtrLsbmUMlO2mnEizDkbU=
X-Gm-Gg: ASbGncso/OwEx7W8j2UGWh1KL45l8e5NV2YfhIMKlz6HDdioCkkOqPgZdmlzWjwrnq/
 8N8a9fNIBYhk7CkzH6bA0ZNBkIGWnVc5MzPNqPi+bgfJyifH3dpd6jfkRx1UK6XpCeeZ8TMcskz
 2LrGMu2tNDn6Exv8hC8wHkyDui8RouH2B1NvKFfvFjwITjEwKadmoLhNHNSCOdqsTjN+q9VyztI
 zRQFP7HUZ6lKHdbLHnMKOq711G9t8PdGdOAzvdtZ3rO226H8hUD3Dz9l0x1GlC5dVj9xI/nU8ch
 jRU/zplDsUmZHuJSiw==
X-Google-Smtp-Source: AGHT+IHe4VlyO6QwtzdDgsc6WpI1upG+iZ+wjWfymJFsSwQPwtHAo8XE8wlRC/4xv8lOU1yzf4AKtg==
X-Received: by 2002:a17:907:d8a:b0:ab3:4d1e:4606 with SMTP id
 a640c23a62f3a-ab789a9a340mr333621766b.3.1738942280827; 
 Fri, 07 Feb 2025 07:31:20 -0800 (PST)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab772f4870bsm286370366b.32.2025.02.07.07.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 07:31:18 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 4FB7C608B4;
 Fri,  7 Feb 2025 15:31:13 +0000 (GMT)
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
 qemu-riscv@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 10/17] gdbstub: Allow the %d placeholder in the socket path
Date: Fri,  7 Feb 2025 15:31:05 +0000
Message-Id: <20250207153112.3939799-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250207153112.3939799-1-alex.bennee@linaro.org>
References: <20250207153112.3939799-1-alex.bennee@linaro.org>
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
X-List-Received-Date: Fri, 07 Feb 2025 15:31:39 -0000

From: Ilya Leoshkevich <iii@linux.ibm.com>

Just like for QEMU_LOG_FILENAME, replace %d with PID in the GDB socket
path. This allows running multi-process applications with, e.g.,
export QEMU_GDB=/tmp/qemu-%d.sock. Currently this is not possible,
since the first process will cause the subsequent ones to fail due to
not being able to bind() the GDB socket.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20250117001542.8290-2-iii@linux.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/user.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/gdbstub/user.c b/gdbstub/user.c
index c2bdfc3d49..fd29d595f4 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -317,9 +317,19 @@ static bool gdb_accept_socket(int gdb_fd)
 
 static int gdbserver_open_socket(const char *path)
 {
+    g_autoptr(GString) buf = g_string_new("");
     struct sockaddr_un sockaddr = {};
+    char *pid_placeholder;
     int fd, ret;
 
+    pid_placeholder = strstr(path, "%d");
+    if (pid_placeholder != NULL) {
+        g_string_append_len(buf, path, pid_placeholder - path);
+        g_string_append_printf(buf, "%d", qemu_get_thread_id());
+        g_string_append(buf, pid_placeholder + 2);
+        path = buf->str;
+    }
+
     fd = socket(AF_UNIX, SOCK_STREAM, 0);
     if (fd < 0) {
         perror("create socket");
-- 
2.39.5


