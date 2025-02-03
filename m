Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1texdb-0003pj-7G
	for mharc-qemu-rust@gnu.org; Mon, 03 Feb 2025 09:41:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1texdL-0003fa-TI
 for qemu-rust@nongnu.org; Mon, 03 Feb 2025 09:41:09 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1texdC-0002Ow-2h
 for qemu-rust@nongnu.org; Mon, 03 Feb 2025 09:41:07 -0500
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-aaf900cc7fbso970364266b.3
 for <qemu-rust@nongnu.org>; Mon, 03 Feb 2025 06:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738593656; x=1739198456; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/577CdB1eWedE91Z4d0PM1VMtk8hOH9rwbGlAE6K9w8=;
 b=sHOqC0vR6eHlwNI6PcgEdE/FX4h0ziH7bPelCgmBDCUI6MYsY+PRNJCVbkcPUL8+ap
 Xobyw+Y3pFTIdgZ7eR3AwmObQyHqJu+hnOr2y78M1u2qeWR238+F7b005yvyaBlmgSC0
 k9odv5xB40MDNbiZjst+sdttbL6cQedSX4uPR7bkVhlpfcWWf0xFHphkI4dICtsLmpXe
 MZcfEQuk0NQYWR9t7SsARjE0CeAIi/BPJngcmv7PptKf0Z1gfd6iqbTc2p31z5NbHkzk
 3c3BhXa9vEqydTRB5Rn+hc1omNEnCXIX6W3GU9v9s55iW281OM9ZeJVGNTQYy6qRYujM
 kH8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738593656; x=1739198456;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/577CdB1eWedE91Z4d0PM1VMtk8hOH9rwbGlAE6K9w8=;
 b=Hp4bc6+Jtu4zY8QdqoIeD9wcRpvxfVC4Jt40cTyiiRxPn0bKJMY9N0W9W8LKlKsXdU
 itFMTOhjjWQS97obz8ZOWssbd1F4v2ONqGMObdzrvLGbFk3fVoZchf9pjHfJ+gFJUmv0
 zO2BhRfYmR5Wnb3jVoyGqM1jyvFzmZmvm/dTDm/BkMXxMQ/5IJ3vsM9NECkJvJ5fP3v6
 OsWbJlt//Id9rswKQ0iYCJf8dkr98xkAJ8cFFm3HSOEUn4/9WdewdvsRfgiWznB6zEZ3
 HNwz3O09wVKk6eEWXCYn/oTaZllg1EyCJh/i1Tjid0theM0MF7+vS4VFCQHJeoe16mRs
 tUUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7rWRVOgAr9LER3G+7xSkjZh9dL54aH73R1in8IZPXk9TJDtO+qcrpAFTTiVYAA73ThfJAES/YsUw=@nongnu.org
X-Gm-Message-State: AOJu0Yzt68QdgZ8RnW3rbWfTT3UNVkzm7GgzlCKll8i1y+14pum00ex+
 2z2EZZqoQvfqSwGtokihMN+FTNp6OfiB0q7O6H3mb1457/OU58//9i5AQA3Y+9U=
X-Gm-Gg: ASbGnctdNgLLVKe/ZiheVMiUOdgYtbrrhiGT7K35Q7nLjOPehHykW58WtcgnLaWkyMI
 H4++AEkUzEnewU1Cr/0bA8ckemQcIbzFJh2hqiE+H/+USw/TTAJCEZTFSkU523itNNyhHS5Tcn+
 gbRXeVwfGuZ0qW/trVLC1V0uN7/6LdFXSttitSLm3/xHNrVoxk4YhSEGdk588iz+VSXgbIQY/3e
 v1A7NVN4TAxEMHRpPHqZntqRy5UBLdV/RYIf6rvLtUUsoXVl8xgYaSe8KZsaBwYycOd0V+W6tBz
 GKVbH8mb/IDvdHBQbw==
X-Google-Smtp-Source: AGHT+IHKcF2++g0wusgoUDeHmIZClv5NVUKi6L+52mtdageLBLkne32ON9bDgwCYMZ/GfaeVIOSc5A==
X-Received: by 2002:a17:907:97c5:b0:aa6:5d30:d971 with SMTP id
 a640c23a62f3a-ab6cfcb6979mr2706860166b.11.1738593655675; 
 Mon, 03 Feb 2025 06:40:55 -0800 (PST)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47d070bsm757877366b.48.2025.02.03.06.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 06:40:53 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 9F6B260870;
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
 Nicholas Piggin <npiggin@gmail.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 10/18] gdbstub: Allow the %d placeholder in the socket path
Date: Mon,  3 Feb 2025 14:40:40 +0000
Message-Id: <20250203144048.2131117-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250203144048.2131117-1-alex.bennee@linaro.org>
References: <20250203144048.2131117-1-alex.bennee@linaro.org>
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
X-List-Received-Date: Mon, 03 Feb 2025 14:41:13 -0000

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


