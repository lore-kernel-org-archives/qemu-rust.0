Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1texlO-0000r7-0D
	for mharc-qemu-rust@gnu.org; Mon, 03 Feb 2025 09:49:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1texlK-0000pI-SC
 for qemu-rust@nongnu.org; Mon, 03 Feb 2025 09:49:23 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1texlH-0003H6-M9
 for qemu-rust@nongnu.org; Mon, 03 Feb 2025 09:49:22 -0500
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ab698eae2d9so902900666b.0
 for <qemu-rust@nongnu.org>; Mon, 03 Feb 2025 06:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738594147; x=1739198947; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BYLUPD3P/9Yhc9T5gc39GsuYcITC/cYJ3+WE96RAZnc=;
 b=ZJmmiEU2YwO8sK8ZLu2i4XWkVHGOwJjSYb/KkJBq0O8xhynSIjoJFsOP5ZT/LwXx/Y
 htZnbgWh4HjGGwu52JTSk9gNHm/c6nFc0xd6G2Ben1p6bJ4fp2w+L/IKQiMZLgvrJG+j
 T7gSlaJ8WAbB9U29hKGg9tlh4bw9MQvAslEna7eBWi+nNLIRxu5dbPPwMOUyX7c+8S8B
 zDe2qocimYGbfvw5F0ld3Inw5OFQ0cv1UpAh4P3Y1F6CRo8bapurCVx4vydseGZfvjno
 3DI4hghj69rNW8Uz257xo9Q0nNR966dv7hKz2+9iOWPx44LOoVR3VjZmI78Hk+TL2AKw
 B6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738594147; x=1739198947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BYLUPD3P/9Yhc9T5gc39GsuYcITC/cYJ3+WE96RAZnc=;
 b=Wc6tDPvBfQCMZKSGTeVq5ECIQv3KC4Dbsr4htovMxPNjwOOjl9tyhnJOLFV6E7JcUY
 o4VUSFLJdIyTxLuepMozHN78gsmR2CN7vkrYXKYDxwV0m0/KX7tfyq9iN0hyHZnim3+v
 cV260zKrkAyfi29ExTjl0Ym3myu9Q1pUEFFmm/2mkFLv0eqpGoOJJolo/WWMVu8ahyBv
 DKIQqwywMsipSHyPaoGBsn3ORzHzJ1YtQPGxHVB3LREQoNm/NRLbn+BJqQ0DoNzRC3Rt
 ZpSwTMgBtlxTdmqAyxiXsoqIszicDhU5iP4gVHQ9x3Cl17euu8LsC/SxOxDl3SJd8O5L
 uF3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7T+OivRyqaPGT3mjE6DlsQik/4FzC0imr3T+/GJ2ziJfcHLbYA8KxSNHkHivrS4lWybwT4ag+TTc=@nongnu.org
X-Gm-Message-State: AOJu0YxlBZvo1scnlQioJgISmO5Q4Vo1P85kLAzLQM+Mwsm8/KShY19h
 odc07pqzzIePqfgl3e61HPT5ukDxvf0tA9+P9j89r83Awxz6Nw50TAwUbD+wtVY=
X-Gm-Gg: ASbGncvnowIZsEHQZUkJGVkRZDVNcLZqmflozRKp3+rO6q09i5VYHzDs1alzn/co0S5
 TZRTWvNilMM+bTQuprKcOgxuY29wr7ppX9apCR8Rru2SLtYX0LzMBvK9f9LJWvSxfzupwvJBBjS
 4Tc0oHJ6ywBV55l2CqKWwzGqwJC/pnVEELha6LB8PmYyCa9C7EgDXV7SVCTJhLe0zfK6RQESF2s
 5AN+O5ZsdsW3T5CY2ShcPE6qulVm2XFEtiTmUF0219LFKhovJ+I/EFz3g6jOsY1eF9K1hgVOoVj
 aM/5V/jyjZTqycZy1g==
X-Google-Smtp-Source: AGHT+IHgsx6VegpQf/B5RuOCVkQFxqV47V8mc1V6eFUOyK0LWGPsQGdoL7+XE026OxIOUgxH9LTjpw==
X-Received: by 2002:a17:907:72c1:b0:aa6:ab70:4a78 with SMTP id
 a640c23a62f3a-ab6cfda4254mr2919815166b.37.1738594147146; 
 Mon, 03 Feb 2025 06:49:07 -0800 (PST)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab71166a8e0sm404508566b.158.2025.02.03.06.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 06:49:06 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 4D79B60C3D;
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
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 16/18] docs/user: Document the %d placeholder and suspend=n
 QEMU_GDB features
Date: Mon,  3 Feb 2025 14:40:46 +0000
Message-Id: <20250203144048.2131117-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250203144048.2131117-1-alex.bennee@linaro.org>
References: <20250203144048.2131117-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x636.google.com
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
X-List-Received-Date: Mon, 03 Feb 2025 14:49:24 -0000

From: Ilya Leoshkevich <iii@linux.ibm.com>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20250117001542.8290-8-iii@linux.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/user/main.rst | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/docs/user/main.rst b/docs/user/main.rst
index 80a77f0a0c..9a1c60448c 100644
--- a/docs/user/main.rst
+++ b/docs/user/main.rst
@@ -54,7 +54,7 @@ Command line options
 
 ::
 
-   qemu-i386 [-h] [-d] [-L path] [-s size] [-cpu model] [-g port] [-B offset] [-R size] program [arguments...]
+   qemu-i386 [-h] [-d] [-L path] [-s size] [-cpu model] [-g endpoint] [-B offset] [-R size] program [arguments...]
 
 ``-h``
    Print the help
@@ -91,8 +91,18 @@ Debug options:
    Activate logging of the specified items (use '-d help' for a list of
    log items)
 
-``-g port``
-   Wait gdb connection to port
+``-g endpoint``
+   Wait gdb connection to a port (e.g., ``1234``) or a unix socket (e.g.,
+   ``/tmp/qemu.sock``).
+
+   If a unix socket path contains single ``%d`` placeholder (e.g.,
+   ``/tmp/qemu-%d.sock``), it is replaced by the emulator PID, which is useful
+   when passing this option via the ``QEMU_GDB`` environment variable to a
+   multi-process application.
+
+   If the endpoint address is followed by ``,suspend=n`` (e.g.,
+   ``1234,suspend=n``), then the emulated program starts without waiting for a
+   connection, which can be established at any later point in time.
 
 ``-one-insn-per-tb``
    Run the emulation with one guest instruction per translation block.
-- 
2.39.5


