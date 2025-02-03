Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1texdF-0003XY-1r
	for mharc-qemu-rust@gnu.org; Mon, 03 Feb 2025 09:41:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1texdA-0003S4-RF
 for qemu-rust@nongnu.org; Mon, 03 Feb 2025 09:40:57 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1texd6-0002LO-J5
 for qemu-rust@nongnu.org; Mon, 03 Feb 2025 09:40:56 -0500
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5dca451f922so2315145a12.2
 for <qemu-rust@nongnu.org>; Mon, 03 Feb 2025 06:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738593651; x=1739198451; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QTDOVYxM0E7wRyBsbgpa8GUo5K0fruAd8IIEzTdI9Ns=;
 b=bfIx4/ddsM9UzAGhPaKwjAeWyH7jl7felKe4s7x/7JvXmAIMVZJmbOPi1i2UWg5bPF
 0PK1WBIjYq0OxgHNdHhzPXTfoVt0aRImjga26zJ6DN47jHq8VK6//GTWcISDzld6OwsP
 KI75O5Z6nz81HF+i+TVNBGOdIXcWgB3mf5nYTCSkVI+JmdLpRM8GmOUZtqW3ozAvq5BA
 MuvOEO8ZjQRMODGhuI1cgIDAdEJoqN+SDshyrisrVLno7YfZbMo+qsihmU/pIIaNXdJW
 QjFeXybFllhSJxNpKsjUl9qpxlzdl7yGHGSU8IbCrPxQ5V/gaNGcpixsDNimX2CxdxAX
 vhIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738593651; x=1739198451;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QTDOVYxM0E7wRyBsbgpa8GUo5K0fruAd8IIEzTdI9Ns=;
 b=UDdOYGJEP1XC9PeABgkEzPDlXJl1uQOOw75P76NKPiG0DxoJaS4oaTkdXwrh/4zhzB
 2PUF/rZF/eDVgKULTvCg3ye8Hnnx4GgGLWvH0Kcc4rmyRz2hu0a/QMBvtEXYeBABk/KF
 f2WjjhNq393U0i3clRDF3X79xr8Q2577/xFMLnM4dArBgTdLf6X4J6lNp28KeJUJcj5a
 f5xcN+ipRW3EDhA7IwgqqivLiBtYTmGmVG4G8ieUEqFRAWLnaSJJrHyUS1kIGQl09MxW
 F70Ch/gf+C5nEnrr6zNPuUAqaePSIIPo1p37Qje7Uqg3yTnn+Dwgc7vwkOpDguFlWmI4
 gomA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqgVkqqzzM3HnQh+asa1XoPMB6cVsL4rPDC3GYH1e/6ngHAu7oTrybZ9/oeK1FoDqNS1HZIHfWBV8=@nongnu.org
X-Gm-Message-State: AOJu0YzHCUhKupoY4sYTxtMNfBCWFZEozdkKuwHlK+LMY6zRuOXei2b9
 UpZiMNa8SaGZz+fpFNPIJo4cr94emZbkTO90MtU45jg1KnHvV2lva8uhanhX/7k=
X-Gm-Gg: ASbGncvDFK8IbovDFpSZ2c21kj6MfROXf2oqZrZ5sb0SAtszk5I1XPs1t+9Lww9wBVu
 BAiyIA9bHd2+Lv0esIJOyOoyuuWaCB3VxKOUZ16IuNstihpfaU9PRREvDeYd+AzbCNMH7Ag3Bkw
 3TL4aNqmfmgZMhaWfp/cnUC+RlD9di47gcgDYPL1TTHZvkO6ejK+khj6FG9w4GWuJT6OLlHRbKv
 CoYqpo0Gi/TxAxPiow08gA4aOB3y8mta57lsEoZ9n5jBT/NeLDirgq3XchCnz5sjjlOXey8iS1V
 Lpv2WXjhxF6xRcsTVQ==
X-Google-Smtp-Source: AGHT+IH/qleD9HY2aVbeknEfPVUsDluqxOpdMDkbIEC7YUJxy/b/vW3wRfGPVg1o5VF1/ZRyzF+I4Q==
X-Received: by 2002:a17:906:6a24:b0:aa6:aa8e:c89c with SMTP id
 a640c23a62f3a-ab6cfda42fbmr2842139766b.39.1738593650836; 
 Mon, 03 Feb 2025 06:40:50 -0800 (PST)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47a827esm773718766b.15.2025.02.03.06.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 06:40:49 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id AAED45F906;
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
Subject: [PATCH 01/18] tests/docker: replicate the check-rust-tools-nightly CI
 job
Date: Mon,  3 Feb 2025 14:40:31 +0000
Message-Id: <20250203144048.2131117-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250203144048.2131117-1-alex.bennee@linaro.org>
References: <20250203144048.2131117-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x536.google.com
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
X-List-Received-Date: Mon, 03 Feb 2025 14:40:57 -0000

This allows people to run the test locally:

  make docker-test-rust@fedora-rust-nightly

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - update MAINTAINERS
---
 MAINTAINERS                   |  1 +
 tests/docker/Makefile.include |  3 +++
 tests/docker/test-rust        | 21 +++++++++++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100755 tests/docker/test-rust

diff --git a/MAINTAINERS b/MAINTAINERS
index bf737eb6db..8008db18ab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3384,6 +3384,7 @@ F: rust/rustfmt.toml
 
 Rust-related patches CC here
 L: qemu-rust@nongnu.org
+F: tests/docker/test-rust
 F: rust/
 
 SLIRP
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index fead7d3abe..fa1cbb6726 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -236,3 +236,6 @@ docker-image: ${DOCKER_IMAGES:%=docker-image-%}
 
 docker-clean:
 	$(call quiet-command, $(DOCKER_SCRIPT) clean)
+
+# Overrides
+docker-test-rust%: NETWORK=1
diff --git a/tests/docker/test-rust b/tests/docker/test-rust
new file mode 100755
index 0000000000..e7e3e94a55
--- /dev/null
+++ b/tests/docker/test-rust
@@ -0,0 +1,21 @@
+#!/bin/bash -e
+#
+# Run the rust code checks (a.k.a. check-rust-tools-nightly)
+#
+# Copyright (c) 2025 Linaro Ltd
+#
+# Authors:
+#  Alex Bennée <alex.bennee@linaro.org>
+#
+# This work is licensed under the terms of the GNU GPL, version 2
+# or (at your option) any later version. See the COPYING file in
+# the top-level directory.
+
+. common.rc
+
+cd "$BUILD_DIR"
+
+configure_qemu --disable-user --disable-docs --enable-rust
+pyvenv/bin/meson devenv -w $QEMU_SRC/rust ${CARGO-cargo} fmt --check
+make clippy
+make rustdoc
-- 
2.39.5


