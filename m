Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tEAWM-0005R0-NY
	for mharc-qemu-rust@gnu.org; Thu, 21 Nov 2024 11:59:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVm-0004lf-EJ
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 11:58:35 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVW-00083n-1O
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 11:58:34 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4315c1c7392so9774085e9.1
 for <qemu-rust@nongnu.org>; Thu, 21 Nov 2024 08:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732208296; x=1732813096; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nh1HSCE0LYEGDQ7X1d/mpdCNk3qVcIIVFU2nc2OFGiU=;
 b=ZKHge06xXU6MZrVT9TqS6+IbdPLQp1KUiJnIQKDsDHCJqp6cdjshAZdiRBL63CMzpb
 bZS3DETY776OCU2HIFes4MDXlPSOlWiyuatX40GXzcteSYTLT9jt3K5MhVSdCAlt5MKr
 Fu0+NEB9u0N93S7Ua182Nnl5zn5EsHyyCesKOodmesn34bdhfBFGjTuuPiPuGJs/3ryI
 wMhZ6kzfZe12RJtWSZ4Ys6SUQs/M2FzPQ/bMiyredIFKdqeXwoXVsd5SOT0VyvABR31F
 Nv9rck7eQenBXK798SrJ28FZ6ba0Ukwk9C52INTg2JyJap1xF83UHHnPwI+Pj7feUD4N
 NE/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732208296; x=1732813096;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nh1HSCE0LYEGDQ7X1d/mpdCNk3qVcIIVFU2nc2OFGiU=;
 b=fVsLXCGTtWmqJjuTNhDshvHXAYajov8PJQepJLw+8zhJ/AD6/d4FIgnPZafPwVUwVK
 NxQlo2lvIus6UXNTwYR5LdHgnfiTudayh2kVSS9G7nYFs5RJ3V77VtDXc20WW27+sGhG
 8loz8JvX7YK3LBPaQaW7es6jeg62vLI7wAmIIHIdzMMnvKoCg+qm8UQ+2pWhRzXtod5W
 Ouj7eI+2HbYgLFXWQ81l/E54AGW0skcec9NFgSIfuwcs7V4M65no4W4+BvuBNRCD79EU
 2d3qowm3joN16MWOK4sGPQpnWQqZFddaUDiC4e+jS3jiBhPndNcAH02GwK4KVLo3SSk4
 i3lQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiy2YVcmPoGF8ZuuKVQ0XeLi1qFr5ycbU+vHypO4U6zf/h/jyg1MkMsVdbIuLhoLU+2fhAYkIXS14=@nongnu.org
X-Gm-Message-State: AOJu0Ywq56t+Wvtz5IBbxGRxr+/i5WLW7V3vjl4AtAswZPXADmOPt/4n
 ZBDY3ra77LZro9BVRz899qNRfDGUjE5BAGnOR4z6dXT57Vzt2aaTE1S3OZ+ZLvE=
X-Gm-Gg: ASbGncvFjOPiagnrsjax3bt4JK+mwgiYuGc39JjnPM/tcQU1yIcZ8Hp4XcnglGnxn68
 rJYVtNAmdGGmSoV2uRaENyiUPvMElhATyzKzi2MtYUyIHPSrCts77JLDEQmSnrC7etN+mH2ZnwQ
 Y+iXyEz3HyHa34nAO2iOTRHl7hBPjo7orRNl+FStCNSvOHldCPJ25IGqRQz8e43VVbsf1Z/ZqpW
 hQAeBXKzSMF8NRlOLyreE0fqHsNxuRrrnB+d4cN9G5IbUky
X-Google-Smtp-Source: AGHT+IFMIRIvLgYx/NGn8gGlDiVz6YLvmj7b0egaaZ7PnQ+VQYm4uHamdyPY85H4BIrE6JL/kr+Z0w==
X-Received: by 2002:a5d:6489:0:b0:382:4ff5:61f with SMTP id
 ffacd0b85a97d-38254b28759mr6329427f8f.59.1732208295832; 
 Thu, 21 Nov 2024 08:58:15 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fb25d74sm31746f8f.47.2024.11.21.08.58.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 08:58:14 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id A119E603D2;
 Thu, 21 Nov 2024 16:58:07 +0000 (GMT)
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
Subject: [PATCH 13/39] tests/functional: don't try to wait for the empty string
Date: Thu, 21 Nov 2024 16:57:40 +0000
Message-Id: <20241121165806.476008-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
X-List-Received-Date: Thu, 21 Nov 2024 16:58:36 -0000

From: Daniel P. Berrangé <berrange@redhat.com>

Telling exec_command_wand_wait_for_pattern to wait for the empty
string does not make any conceptual sense, as a check for empty
string will always succeed. It makes even less sense when followed
by a call to wait_for_console_pattern() with a real match.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20241121154218.1423005-14-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/test_virtio_gpu.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/functional/test_virtio_gpu.py b/tests/functional/test_virtio_gpu.py
index 441cbdcf2d..d5027487ac 100755
--- a/tests/functional/test_virtio_gpu.py
+++ b/tests/functional/test_virtio_gpu.py
@@ -80,9 +80,8 @@ def test_virtio_vga_virgl(self):
 
         self.wait_for_console_pattern("as init process")
         exec_command_and_wait_for_pattern(
-            self, "/usr/sbin/modprobe virtio_gpu", ""
+            self, "/usr/sbin/modprobe virtio_gpu", "features: +virgl +edid"
         )
-        self.wait_for_console_pattern("features: +virgl +edid")
 
     def test_vhost_user_vga_virgl(self):
         # FIXME: should check presence of vhost-user-gpu, virgl, memfd etc
-- 
2.39.5


