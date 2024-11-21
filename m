Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tEAVc-0004a6-Ao
	for mharc-qemu-rust@gnu.org; Thu, 21 Nov 2024 11:58:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVX-0004Wf-Ab
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 11:58:20 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVP-0007z8-T2
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 11:58:19 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3822ec43fb0so846879f8f.3
 for <qemu-rust@nongnu.org>; Thu, 21 Nov 2024 08:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732208290; x=1732813090; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VMCy7EhA7nNoXN4BB2O8qdNc46ZWyWADLDGmK+DUhKU=;
 b=mh/pMQscgda3GBpKKZrTP77SMcDtIQAa4M2gSFFXRGf3U6HW2sE9lhCkuT8Fh58kjx
 HOCUNd+xI3MPs6RWXgUkYFv+Fw5GUOivptbIndw8f2rbzt1s3H4WrwzYWYRXgqKIO0Ez
 nMQF2xAKTwyVLbqJMHCQH+YEwZTjOznHidTJt9JjVy4ykZjHi+gcr010Nj10/NtNDx57
 aSKVyrNK8vTYBFxz4Q74Ytf0ZDljDPKUIp1qBQ5DKUyodS7DtAuTvFjLgHR88GFoU06P
 Mv8NlCiLqOxq/epobvrRW3REUh2cG9JUp1hmN72Z22Dgznw29ggdiDilGmXj5j/xWcQU
 5bOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732208290; x=1732813090;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VMCy7EhA7nNoXN4BB2O8qdNc46ZWyWADLDGmK+DUhKU=;
 b=TmZEfFKZCg3++ChQUfgUKLZ7iaQwt7y1Vgn4Awi8wP0ldIhqJlbT/njjakbtkZBfcu
 dlUr9eUNLT7iLT8g3VnONDTs4QYu4YtCiYECwAJDBBrm/LLxhh9wgQpwRGYnPz7X+tIS
 tQxZyQaEx2+1uhEbJ/9S9I/qYXIp+P3lei5e/XZ937ND0tS8jdjIhURdduCacJe1521w
 UPB8AV969N4ubIxC8+rNU6eBnwuakNMQ6WwKKcpwLW4FfHumu4m2mhcBBGyoVTqa0Z5o
 ixX5UmFqOpfz02udJ08apT5dEn0OXHPfkHdbUy9HTT4KhrJBIoH6xPBbQp0mPbh6RPbS
 fOMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0uIZdG402KoXx68Vk//LQzGWIIGrNpRzAXNq0apLBudr5wkI6Cot8NA3L1m2T3eAsEF1Bm9WryjA=@nongnu.org
X-Gm-Message-State: AOJu0Yy6EJ3ptbtb+k1YhxOQLTxJy4dAmyteOGqCClat7+3PK9LPSpp+
 1kFNWbkpiAijD1FOOjm8D3s8CUWkOpjsY1OZDFvAm+1zpkTuWmjmD2TEm7GZdZw=
X-Gm-Gg: ASbGnctqhDQLb/8OVArZ7f0R+464uElpkQqyPxEzNtCsgJDr5PV2XCu/QVi2RBqIqDk
 BAE1IlcNL4T9zrqrkrNWnM3145PdC4b7nN9N+iZMjb0JlnPEESknATRZ83XbdNhRN9m35V8ayIP
 9YpPQX4jKq5sF2d4gMpjXFhEojp8YjEL6sCVcfgW30knWnv6+Wn9MWb6KzSLkULV+rIc3T1o1TX
 Cj2L4pvaPItm8HkDAe+WN+DH+MlCQwAy6C3MksmWrzF+e1c
X-Google-Smtp-Source: AGHT+IH+MC7eCDHoQMDKArNYsaKTywvUGhZHwwjRj/MFMddUvEvD+S7p1jx61D8QzHK0h/caHtIs5w==
X-Received: by 2002:a5d:6da9:0:b0:382:30a5:c377 with SMTP id
 ffacd0b85a97d-38254b01509mr5296140f8f.32.1732208290382; 
 Thu, 21 Nov 2024 08:58:10 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43366cbcd17sm45828635e9.1.2024.11.21.08.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 08:58:08 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 863075F92B;
 Thu, 21 Nov 2024 16:58:06 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-riscv@nongnu.org,
 Thomas Huth <huth@tuxfamily.org>, Bernhard Beschow <shentey@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-s390x@nongnu.org,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-rust@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Markus Armbruster <armbru@redhat.com>,
 Weiwei Li <liwei1518@gmail.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Ani Sinha <anisinha@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 01/39] tests/functional: fix mips64el test to honour workdir
Date: Thu, 21 Nov 2024 16:57:28 +0000
Message-Id: <20241121165806.476008-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
X-List-Received-Date: Thu, 21 Nov 2024 16:58:22 -0000

From: Daniel P. Berrangé <berrange@redhat.com>

The missing directory separator resulted in the kernel file being
created 1 level higher than expected.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20241121154218.1423005-2-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/test_mips64el_malta.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/functional/test_mips64el_malta.py b/tests/functional/test_mips64el_malta.py
index 6c6355b131..24ebcdb9c1 100755
--- a/tests/functional/test_mips64el_malta.py
+++ b/tests/functional/test_mips64el_malta.py
@@ -129,7 +129,7 @@ def do_test_i6400_framebuffer_logo(self, cpu_cores_count):
         screendump_path = os.path.join(self.workdir, 'screendump.pbm')
 
         kernel_path_gz = self.ASSET_KERNEL_4_7_0.fetch()
-        kernel_path = self.workdir + "vmlinux"
+        kernel_path = self.workdir + "/vmlinux"
         gzip_uncompress(kernel_path_gz, kernel_path)
 
         tuxlogo_path = self.ASSET_TUXLOGO.fetch()
-- 
2.39.5


