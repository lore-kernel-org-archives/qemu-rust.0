Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1texdJ-0003dK-NW
	for mharc-qemu-rust@gnu.org; Mon, 03 Feb 2025 09:41:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1texdC-0003Tu-H1
 for qemu-rust@nongnu.org; Mon, 03 Feb 2025 09:40:59 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1texd7-0002Lg-8F
 for qemu-rust@nongnu.org; Mon, 03 Feb 2025 09:40:57 -0500
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ab2aea81cd8so804138966b.2
 for <qemu-rust@nongnu.org>; Mon, 03 Feb 2025 06:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738593651; x=1739198451; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3UFLMzp9qGvO/TMJfobXhH747ty7fBk8K8S5c0aFteA=;
 b=OJkpiYtD6E6GEmmqrI9dSgSRSlzrb1j0auefJdyFSeiqYpuBDUasJJj3HwdPcvDSPE
 6pEwYe0KAWpsYLshitEQX+N+4YiOn2rMOMB1NFtoCt+FZRvYElZpS2fNZS7ExCP7JY5c
 XZbP1GFNt8pHc9DPY436eyYtKtU6BxsrKU43mEAnLpf7C6AL2+l4oDEcJrn7nAOUpgdj
 /7yAZ8AP7qrmOkxjhWGoV3GmVJCrvr4977H1EpNR/kgvmXA+JHJ3VH/ArXjWccPr/nit
 YzFk4/EQGoQNURCHp0UKHH93ir/V9AsLjTNXh/JtL8g2DMgm4C/40GkxrpDxnfYU7BoW
 CmxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738593651; x=1739198451;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3UFLMzp9qGvO/TMJfobXhH747ty7fBk8K8S5c0aFteA=;
 b=j064vwaQ0nBFpxig5MAhe8v0Bjsjyxx2+yqhiK/Z0dBA6lXwwn6HA5KSCMU/8wdoTe
 pgXj5y66mxX8cnKbZTtU3+wDwp/yeL8lOAlKYx5YHgPvhRTfRI48W7knPtNT3kMOf+XZ
 J4ncduntaWz7PiCvCoLqmIDn9oLamRraYUsy1hxbxiwnRaytXQTQj7axWDYNIGqocqm6
 8gS/zkbFPKaNcbl3zmvOJJxTj0LqTTpgAzK43F1tnszLd1LE4Y4f+CJdveRXcRQa5rq3
 m7mrfSBSmEhtQmY+cxDyZRq9h7rvdkazo+B03MZoqtE068JtNqht1cN+w0F4Wqbsosm2
 eKFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhA5HG8QweTbchnv+iMRge/7kjsaeNcGVLBhHCxG4doP3demRLXPpDiYsnhw9rPFsxzL/ES/y0ZEA=@nongnu.org
X-Gm-Message-State: AOJu0Yxq3E81F/fXISrTy5gwDZclvL9uzrYuT2iJ/YA8FTBLbWX8ysib
 31Si9BvbvXqiKm2re0JQAd6/OT4+3vjER56mj7XQISFGtHlj2qIua5BL01f0q7I=
X-Gm-Gg: ASbGncuFMLYNiarINrudCGr9QDnVch4y8IWcjOIosHIopoJNLYuDL7FjQSiD1u7aUOr
 /UHozN/tcNNKK+DP1gk6UjNLhkGYl6vSwlu9AXIoOM/N+WsAU2febpKjRGUj3Deh5OHKZXCZskJ
 9lICAg5w1RIzlr+h2y7A/VjeqxMsij3iCbK5XsV9q39tI/6ALHvVPgFtfxe4m3PaGEpfozehxrK
 ihQmcYDpsPFa8rpjGikdKPsqMn3tVKEGIQcZLgDY/Q6U66TW6kmCVeVgH15rRZ9mYpoQ7loXNCl
 5GHchkdgyzxln1ygVA==
X-Google-Smtp-Source: AGHT+IG0zaflt4qSNl3JLzdRpFKBH69FVSs2gb6xQjdVTDOzbslkKT/244mgkH7SbwOCFoGmQQLEcQ==
X-Received: by 2002:a17:907:72c4:b0:aa6:5eae:7ed6 with SMTP id
 a640c23a62f3a-ab6cfce8dbbmr2236592666b.13.1738593651441; 
 Mon, 03 Feb 2025 06:40:51 -0800 (PST)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47d21aasm763112666b.74.2025.02.03.06.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 06:40:49 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id C3E6D5FA53;
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
Subject: [PATCH 02/18] tests/qtest: don't attempt to clock_step while waiting
 for virtio ISR
Date: Mon,  3 Feb 2025 14:40:32 +0000
Message-Id: <20250203144048.2131117-3-alex.bennee@linaro.org>
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
X-List-Received-Date: Mon, 03 Feb 2025 14:40:59 -0000

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


