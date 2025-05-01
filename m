Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uAcuk-0008Qn-FF
	for mharc-qemu-rust@gnu.org; Thu, 01 May 2025 19:01:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uAcuh-0008OU-4H
 for qemu-rust@nongnu.org; Thu, 01 May 2025 19:01:56 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uAcuf-0002Cr-He
 for qemu-rust@nongnu.org; Thu, 01 May 2025 19:01:54 -0400
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-3d6d6d82633so4994635ab.0
 for <qemu-rust@nongnu.org>; Thu, 01 May 2025 16:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746140512; x=1746745312; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HR3XLRk6SAEmUPB+v+pYNKb/eOwBOPxJBouKIIv+88o=;
 b=dKFHl5fZVh8PUkVmGSU7gsYPDFVRAe3s+UqUmQUwjIUTrQkG3c49nqWYpBlVFNzUIZ
 wg+Yx8ro2r7pBnTsosmN5gbjlJFAozabZWKvrDU0zhZW1CcYERyLwwAZwMOvt4mCXP3d
 aVzOijbbPpuKNa1jET+2/Cu9FHTGVSrrKhknQbeofdaK0vdCfZ+afFRNKfJPKoCC6ekA
 ratST2HusuqE2ihfVFnx950oAbjwiJIXcobpZOV1IppTXZdwYf+u1n+p6BKzoTVT9baN
 vYrUx0MmnjhnJM8W7UJSJePd6PxQ74Bxi+h+W26QXRQpi8ehM61DMPDe+ZOYzPs50qiJ
 FP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746140512; x=1746745312;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HR3XLRk6SAEmUPB+v+pYNKb/eOwBOPxJBouKIIv+88o=;
 b=hicIY6JLxLPkymVC5vvlXsJQf2TsTwnlNRPF+VCU+kLwaOlauW/2Y/3S3mcCyVMU1l
 odRb3KuayeXvzDQscdleoSDNDB5SByB8ELQ8JfSkTjtFj6JUoa69loa0mOIOYhVS2ddC
 qdeq9IjGjx7ZYgNKU7jqq44CVR+w34iU0LaUMxJU+nXs75NHyWvs22rwkcl5PRVDJKXH
 4nC7Mhy3C0BU0sVyB3OwheB0EOkJNlKbAsuDPUVGTwd5ok1VcNUmWvkRWGXczPvDxHby
 4pNATMf/4t0wok6PAgqZpoVcMGiir1ShYbEPP+z+a7V4oL82Y1jQqZyW8tqXQWBw8LUA
 gRXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlxhDfwazccqGlV2cDEOH/0hJhCl+uObdzrJ6RyV+l6WwMib4SeYqM13j9vvxB5J9dC8AAh6u4Zfc=@nongnu.org
X-Gm-Message-State: AOJu0YyckuZP+31O+yxvZPCEuYmGaAibq2PWHcJrRqQgRDaS5J6qcAWS
 O/P1l7bvw9zBFnOu48+deMkWSqEKM/mP4VxGTZqgrCPFsw/Iau6145N/32a+cK4=
X-Gm-Gg: ASbGnctiVsp5jGaj8gRH27rfm3glkQZlOoro7tR5c+WHvwSMzmqLWUhCWE8e729XQlG
 GsmrOQhlI9DRuP5YwFe5JsP/CbjswRg8Rb6/M0NNoVcqnO0bohVJjgrqCAhxwZs1QTV64p0E6v8
 EDsUgW/+VyYmRFBsx46QruNLV4GDKXfyv3t27wGL/Zj/jEV1tiUzVYBFpy1BvPInHPIbO85KMCd
 caLKswyAgl5aQOWxHMZmv6SINgn3NgQ4YYnrTdUvyBhtCog5r6x/vBCthd0Uq5IAr9ZLnPwTMa/
 VHje4qcOBlGa0716A9pYpZS4SiWZuv/F9yH9F/oNYMgHFFs/29bl+xskYvUQEjZKcu9keCcVX1s
 toIKLLlRRsyEWWtH9/c4X
X-Google-Smtp-Source: AGHT+IF+zogESUgYq1Zuk8I+NvCRr/x4lbeuxpRk7cDzkOJybi0oTAcDvgmWr9stqpOMpRhyGV3/0A==
X-Received: by 2002:a05:6e02:2167:b0:3d3:db70:b585 with SMTP id
 e9e14a558f8ab-3d97c2d3097mr10148415ab.21.1746140512111; 
 Thu, 01 May 2025 16:01:52 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3d975f5885bsm3404135ab.56.2025.05.01.16.01.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 01 May 2025 16:01:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-rust@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, Eric Farman <farman@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jason Wang <jasowang@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: [PATCH 02/10] hw/core/machine: Remove hw_compat_2_10[] array
Date: Fri,  2 May 2025 01:01:20 +0200
Message-ID: <20250501230129.2596-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250501230129.2596-1-philmd@linaro.org>
References: <20250501230129.2596-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=philmd@linaro.org; helo=mail-il1-x132.google.com
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
X-List-Received-Date: Thu, 01 May 2025 23:01:56 -0000

The hw_compat_2_10[] array was only used by the pc-q35-2.10,
pc-i440fx-2.10 and s390-ccw-virtio-2.10 machines, which got
removed. Remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/boards.h | 3 ---
 hw/core/machine.c   | 6 ------
 2 files changed, 9 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 513eb2a54fd..f2f58ec4ed8 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -829,7 +829,4 @@ extern const size_t hw_compat_2_12_len;
 extern GlobalProperty hw_compat_2_11[];
 extern const size_t hw_compat_2_11_len;
 
-extern GlobalProperty hw_compat_2_10[];
-extern const size_t hw_compat_2_10_len;
-
 #endif
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 486d1adb4b9..816d503b2a1 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -238,12 +238,6 @@ GlobalProperty hw_compat_2_11[] = {
 };
 const size_t hw_compat_2_11_len = G_N_ELEMENTS(hw_compat_2_11);
 
-GlobalProperty hw_compat_2_10[] = {
-    { "virtio-mouse-device", "wheel-axis", "false" },
-    { "virtio-tablet-device", "wheel-axis", "false" },
-};
-const size_t hw_compat_2_10_len = G_N_ELEMENTS(hw_compat_2_10);
-
 MachineState *current_machine;
 
 static char *machine_get_kernel(Object *obj, Error **errp)
-- 
2.47.1


