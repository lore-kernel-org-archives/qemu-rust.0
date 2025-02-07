Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tgQLP-0000kg-Bn
	for mharc-qemu-rust@gnu.org; Fri, 07 Feb 2025 10:32:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tgQKH-00086X-Ci
 for qemu-rust@nongnu.org; Fri, 07 Feb 2025 10:31:30 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tgQK7-0003xw-IU
 for qemu-rust@nongnu.org; Fri, 07 Feb 2025 10:31:28 -0500
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5de4a8b4f86so1199386a12.2
 for <qemu-rust@nongnu.org>; Fri, 07 Feb 2025 07:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738942277; x=1739547077; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3UFLMzp9qGvO/TMJfobXhH747ty7fBk8K8S5c0aFteA=;
 b=kOljxhz4VbNtfTFeYvbgwiMvzXMLiNtH7LM/Z2jQ14plEOuRY6r56EMcP7x94Opf7Z
 3kJLTkaFcddZBZ+KJ+ZYY6WTZ4y3AAnHyUO5tSUyi/c89VfTdlnoJy8EOfHMRPuRjZhz
 1JOKaoK5fcDPW9+jMtbbvCeiBVs2oMiiKIfQhfUaWSt0Gl8sLKSLmBwJhPcZqpg58unX
 w3g0YFRa1HS641Sk/bE9y/5nRTfD2bkjJSFc504R4CZ5Ach+MmAw5S0+FxxNLcISwCqd
 9es6bEe31v/qRyJM6Jcx+2GzLtQGLthTLaiYVnTL2Q5ejGOSrOAJgJwgYo5WDRRceeCe
 TqWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738942277; x=1739547077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3UFLMzp9qGvO/TMJfobXhH747ty7fBk8K8S5c0aFteA=;
 b=tCoSRbvdjjMFA3mKPEvYMVq3AVHqqmDHUo3S8y0+Itnx76t/zPXy8vFibQ19mxQQuG
 cYra7atMCV5urpzKJ3CtM9RMkvZKlKiGxiWbqKaaz4XlQQ3c44uaB7y4YVC4WY/gSUW4
 pV5Ii8wwBm2JmXESdVwUBu5aJTEAvbhbbtzFXzAlWtGuPNAT2nUTX3/9shrVoix3Df09
 KtABCvdYlOOsfxxgsfwmvCSC4Qq0a6g3K5+hih30d0YFzXTQ/Nj9FZBIwg7z1KhQrx4M
 zzF4KRLE2WBBMt6NybJmycQF2A7RIVU5HS5EI+E+DGwFZcr05X4psQviTwLTa3H6Bxey
 39ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSlNQ6CTXnXGZLtd7vsAr+ztPeCRYwyzNwPF13D3erEiANO2oLj+Fo17An5H9I6+hWli1i5fS2LgE=@nongnu.org
X-Gm-Message-State: AOJu0YyeavC1jkMwud6zC0zTptmns+Uu9Uz+dxDVyMPDSzAj1sdGpE7G
 bD2rDNMzebf1D/Kvem+8hULOaSHy/u7Ywh4uIXhtPo9DiPLuXjZ2xAmM/OkCqJ0=
X-Gm-Gg: ASbGncuxwkHaGfJ+1TD4HklvtPlYWS6kzpct7z9OPjoeHNS3L/O+aomq338A/4dh/5L
 uewuXkuqNse8x4JaGBBcsdTRu79nKO2L6yr4HRzigLv5RcilqdPl7/WGdYuFdOBxtJGIs8fNMA1
 oHbIet/jOOVVReelK6lljrSO2d7vJ4Pd8Kj5D+aOF2fF9XOQx3Ww0jB76F8y0ru2P5sKX5FGJu+
 rlaEFVNA+vO9iWhhoxJ4+Snj4v4b76OWHWARbXzWRlGClgao3At5mdqrLIJxRC4v5yVKxaoM+R6
 weNGrJX5/OcfK2x3eA==
X-Google-Smtp-Source: AGHT+IG8ZPiaiwh2i6Ruqhu1oc0MU7xyIwgymiNV7MhsYENzi9yUszwe87chpu9OFUlczf0Fx0mLcA==
X-Received: by 2002:a05:6402:51cf:b0:5dc:57a5:c414 with SMTP id
 4fb4d7f45d1cf-5de45088202mr4207907a12.30.1738942276558; 
 Fri, 07 Feb 2025 07:31:16 -0800 (PST)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5de52712538sm325379a12.49.2025.02.07.07.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 07:31:15 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 924C95FA60;
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
 qemu-riscv@nongnu.org
Subject: [PATCH v2 02/17] tests/qtest: don't attempt to clock_step while
 waiting for virtio ISR
Date: Fri,  7 Feb 2025 15:30:57 +0000
Message-Id: <20250207153112.3939799-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250207153112.3939799-1-alex.bennee@linaro.org>
References: <20250207153112.3939799-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x529.google.com
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
X-List-Received-Date: Fri, 07 Feb 2025 15:31:33 -0000

This replicates the changes from 92cb8f8bf6 (tests/qtest: remove
clock_steps from virtio tests) as there are no timers in the virtio
code. We still busy wait and timeout though.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - fix trailing space
---
 tests/qtest/libqos/virtio-pci-modern.c | 6 ++----
 tests/qtest/libqos/virtio-pci.c        | 6 ++----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/tests/qtest/libqos/virtio-pci-modern.c b/tests/qtest/libqos/virtio-pci-modern.c
index 18d118866f..4e67fcbd5d 100644
--- a/tests/qtest/libqos/virtio-pci-modern.c
+++ b/tests/qtest/libqos/virtio-pci-modern.c
@@ -173,13 +173,11 @@ static bool get_config_isr_status(QVirtioDevice *d)
 
 static void wait_config_isr_status(QVirtioDevice *d, gint64 timeout_us)
 {
-    QVirtioPCIDevice *dev = container_of(d, QVirtioPCIDevice, vdev);
     gint64 start_time = g_get_monotonic_time();
 
-    do {
+    while (!get_config_isr_status(d)) {
         g_assert(g_get_monotonic_time() - start_time <= timeout_us);
-        qtest_clock_step(dev->pdev->bus->qts, 100);
-    } while (!get_config_isr_status(d));
+    }
 }
 
 static void queue_select(QVirtioDevice *d, uint16_t index)
diff --git a/tests/qtest/libqos/virtio-pci.c b/tests/qtest/libqos/virtio-pci.c
index 485b8f6b7e..002bf8b8c2 100644
--- a/tests/qtest/libqos/virtio-pci.c
+++ b/tests/qtest/libqos/virtio-pci.c
@@ -171,13 +171,11 @@ static bool qvirtio_pci_get_config_isr_status(QVirtioDevice *d)
 static void qvirtio_pci_wait_config_isr_status(QVirtioDevice *d,
                                                gint64 timeout_us)
 {
-    QVirtioPCIDevice *dev = container_of(d, QVirtioPCIDevice, vdev);
     gint64 start_time = g_get_monotonic_time();
 
-    do {
+    while (!qvirtio_pci_get_config_isr_status(d)) {
         g_assert(g_get_monotonic_time() - start_time <= timeout_us);
-        qtest_clock_step(dev->pdev->bus->qts, 100);
-    } while (!qvirtio_pci_get_config_isr_status(d));
+    }
 }
 
 static void qvirtio_pci_queue_select(QVirtioDevice *d, uint16_t index)
-- 
2.39.5


