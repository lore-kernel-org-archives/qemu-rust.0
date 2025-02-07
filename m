Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tgQNV-0004Nn-4X
	for mharc-qemu-rust@gnu.org; Fri, 07 Feb 2025 10:34:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tgQKT-0008Fb-Ky
 for qemu-rust@nongnu.org; Fri, 07 Feb 2025 10:31:51 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tgQKG-000448-6e
 for qemu-rust@nongnu.org; Fri, 07 Feb 2025 10:31:40 -0500
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-aaf0f1adef8so407737866b.3
 for <qemu-rust@nongnu.org>; Fri, 07 Feb 2025 07:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738942285; x=1739547085; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BYLUPD3P/9Yhc9T5gc39GsuYcITC/cYJ3+WE96RAZnc=;
 b=cNWUNp6iqSEN5S+2196aERtNTILTuYe7zoTFQEYG2iVvo6cNmv7LfgHfBLKsjcEKbV
 /TlcM2NFGPJf99CjtpwxiZhWi24C/Z8oUuRFhsWz7z8eH8gqbTBDqiuWNRI63xFdInDJ
 ZDSMJY+gjwYjrIkVOzh0C6sumFaArCuw2eS56B4glzmFGX0bTviMXW0Ehr6Yj8C/eNUr
 NcezNty/W1Sa9wvvLG63REW8sSnWRigyiFvCSfboJwCwBiAOIQrARXTNbOhVcXZE2uM/
 QBniJ7KcLfm0kDseFLy3n5Zt3i7X9yGVV7Z9Y5uah8XSJaAxz4DRNC1Po/Pz7WhxxffP
 1hfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738942285; x=1739547085;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BYLUPD3P/9Yhc9T5gc39GsuYcITC/cYJ3+WE96RAZnc=;
 b=dzg/tfnVjxGyVmAgSj5y/jzPFpNe7DHlWJwaxsbxI5k7UJYgyIMPa+YatGqD0QZjm4
 KWCeK68s3N9A7M8ejP2oI5eLUllNh91X/HFIECeeKLqB0UV2DaB+g7Z4Uo1yU+yEUTc9
 zgqReElCx+Iyo/fFc+EmSBbKuR4kZ61uzEt/UY75uT5e5WbwMFo/vkljelFe9O9/R8G+
 kd4TLZlsWtHWrLZI/qNfepRh8X7Ic15tNkqkmwZvDwLt5NJioM5/RjgsIyxF+6rfV5xq
 WZ2sugahrGZSMsbpXQxfjJcBTQL2JxjLjeg8gVC2f2aivlfcSOsk6VnqzX0ReHEV1RMW
 5dLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYr1ztutwd7Fkr+Ch7cpOcUhmZGxGJKAeFP0tKxtuZS2Nl0IW4viZKYakSjEj8KKidlc77s6HOYmE=@nongnu.org
X-Gm-Message-State: AOJu0Yyy3cLuurKBGyCPzN6TISxakLSbnvl9hMRvx3we0cK08OMLULLU
 itxGrhTNLXhcbm9CLs3kf78nX+qRWaNUtV09kMA81WAgHqYAsWi7Lt5tfFwlfgc=
X-Gm-Gg: ASbGncvvfXpQGOjAxm1wijZueNHH5BUsOI+0oAiYTRvk6rLXKvJ1IPy5pQD7SdPUKZk
 qvuDUyTHxBfh7lFxoYDEjhwXFxqGlz/8MlbvNQ0RRllEz6XMOf5i6LsqV9/ZjWtrUB9rEZcPO1J
 sF0IGOURl2FqYMjRmJfrd+nzfCojTosrRz5Qw72W4Wg0FpIKiY7ghbmRgo0nSpdzr8PJ3yu+hHe
 agHu4Gd+AETpGRgKGtbyId+xbdt/uw3CFcua1GFoohO8NeZzbDnSOJAs7q9j3roq8MtIXGcHJrD
 j/eoJKspGpCthBBw6Q==
X-Google-Smtp-Source: AGHT+IGktyptZvO6wP9Lf0Vti23wWr2h2wRy8URVUKIHWi7WMZ3mQAsLZNP4ZAvhdtyZeAjI8cic8A==
X-Received: by 2002:a17:907:c28:b0:ab7:63fa:e368 with SMTP id
 a640c23a62f3a-ab789c87ec5mr381999866b.52.1738942285213; 
 Fri, 07 Feb 2025 07:31:25 -0800 (PST)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab772f842c8sm285285766b.39.2025.02.07.07.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 07:31:20 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id D224960F1B;
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
 qemu-riscv@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 16/17] docs/user: Document the %d placeholder and suspend=n
 QEMU_GDB features
Date: Fri,  7 Feb 2025 15:31:11 +0000
Message-Id: <20250207153112.3939799-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250207153112.3939799-1-alex.bennee@linaro.org>
References: <20250207153112.3939799-1-alex.bennee@linaro.org>
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
X-List-Received-Date: Fri, 07 Feb 2025 15:31:58 -0000

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


