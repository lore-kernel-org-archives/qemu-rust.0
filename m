Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uAcv1-00007x-Ug
	for mharc-qemu-rust@gnu.org; Thu, 01 May 2025 19:02:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uAcuz-00005y-VF
 for qemu-rust@nongnu.org; Thu, 01 May 2025 19:02:14 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uAcux-0002HR-6q
 for qemu-rust@nongnu.org; Thu, 01 May 2025 19:02:13 -0400
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-3d6d6d82633so4995415ab.0
 for <qemu-rust@nongnu.org>; Thu, 01 May 2025 16:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746140530; x=1746745330; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=71cRgUxX/xvkQOIndCsIbPhvcAM9aTUzOonse2qZKrA=;
 b=mgkIZE04GSyocR6PPP6lza7MAKZy3C8ca4U0N5nT6kmMw/gxTeCtv5W1CyyidWGEgJ
 4bkFS5MByHX2qHVjKy3Li8d9GYkg3ZR/sB/DZAbfBjmAU5X9cvB21p4jZcnq9gwJWYvn
 rhDYutjZLaNdN8D/1wL40kI5JqDIcHT/cP5pEEKGUDsMROW8IOLL5W+dpFOkRgQG1Ovh
 tqALGoJZkFEmikt8k4kUJShDrg9+ZlVBFd3EfA/LzWyI82QN81p4LgFUUH4aQGnTsfdb
 oCI5fuxkAzkFKM5aOCfo64Qcbv4tBTC0pjCv9ionsNYOf9wgY1V4aeb4JxNfZ+g4ABMT
 6dlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746140530; x=1746745330;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=71cRgUxX/xvkQOIndCsIbPhvcAM9aTUzOonse2qZKrA=;
 b=FyFoZafAVke0qCPwQ47D/BRJiRZOyezOml7TQAsv3q0Qms4t0P6BVIkF/Up8zQcLOB
 LJ5MVNvEnS22yZJnlaft3in9Nhr9eJw70cOxwAeH2D9c16YZHA+/hz7AMgfdN/LJ/aF6
 n0vrPoKsha2rClLn7Sh1L9zEfE/V7t6CZyEIXyMGbVrhralKuRhEKS0+yeHLnGU2cE9q
 x07daeGA9PP5wZzir4MRocCIWy/qgvJTjAXoGC1pj4J/Wx9WVMIjjkiXYerL3ez2T72x
 6gFG+xyQd2941C7WO9nTDnRxbFfFSa0plyi+7hGNtSARjXa0grtHC5mRlrlYeybuJsrG
 M1sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMRYdxkbLODL3k3IodkNyK1xAANdjkw8lB95bgXFlEi20D1F1aUHtqsnuJWUnXeeNVbkKrfkOVwlY=@nongnu.org
X-Gm-Message-State: AOJu0YxarPbw1mp4cEwPjBd5jVhYq04o+96ZDDFmPK9mWVsEBbC0tUvs
 2puBgh2XZ4yI/hK5fb6I3NRNDIPZ21o1Ffqk95AlJ+rImE9esFsbytOwcvxBKV4=
X-Gm-Gg: ASbGncuu85ZfYybXNd753rw5zbneILUmqydXfw/ViBHssPcSu6skiHXDRDvT2Jq0Fa+
 f7xAIuKhxt+/674EfjVDjsC6eIcVDnC1sGD9bdoDQzbQ8QafhkqIYcnBnH4FK5WFkNbTrMH6L1J
 JJr3xiF3eLDq7mDdi04F2PWMvgAK3+CXqyTX6roIgU7EKn6O4fEsCRfb8BTB0nmMMCBXkwa/9iz
 09UPPv5l0Tj0oEXZCyjjBmhIM9OlMe6H5c800MmhOEK2uK7FQWsUxCXvDw4RDjxuG+nt9OPxBKv
 mvuZroYv3qDujmB0PSFfzndUslOO9a9YwiRuWdZbpTeANWG7dVhYir/dEhqc3J+SHEBhNMqdg3E
 yPnIb3+/X1GyyS7LBHTWv
X-Google-Smtp-Source: AGHT+IEksWUSalHmdf1L0lBrQ4kJnb1Zq0e9zprZ1OTx3tRVCreMHfEejwW82x+JiiUe/xwS18W23A==
X-Received: by 2002:a05:6e02:1f82:b0:3d9:6756:14b4 with SMTP id
 e9e14a558f8ab-3d97c288232mr9587435ab.18.1746140529786; 
 Thu, 01 May 2025 16:02:09 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3d975e7d0c6sm3679665ab.27.2025.05.01.16.02.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 01 May 2025 16:02:09 -0700 (PDT)
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
Subject: [PATCH 04/10] hw/core/machine: Remove hw_compat_2_11[] array
Date: Fri,  2 May 2025 01:01:22 +0200
Message-ID: <20250501230129.2596-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250501230129.2596-1-philmd@linaro.org>
References: <20250501230129.2596-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=philmd@linaro.org; helo=mail-il1-x130.google.com
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
X-List-Received-Date: Thu, 01 May 2025 23:02:14 -0000

The hw_compat_2_11[] array was only used by the pc-q35-2.11,
pc-i440fx-2.11 and s390-ccw-virtio-2.11 machines, which got
removed. Remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/boards.h | 3 ---
 hw/core/machine.c   | 8 --------
 2 files changed, 11 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index f2f58ec4ed8..16cef33beae 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -826,7 +826,4 @@ extern const size_t hw_compat_3_0_len;
 extern GlobalProperty hw_compat_2_12[];
 extern const size_t hw_compat_2_12_len;
 
-extern GlobalProperty hw_compat_2_11[];
-extern const size_t hw_compat_2_11_len;
-
 #endif
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 816d503b2a1..8f1b44b70f7 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -230,14 +230,6 @@ GlobalProperty hw_compat_2_12[] = {
 };
 const size_t hw_compat_2_12_len = G_N_ELEMENTS(hw_compat_2_12);
 
-GlobalProperty hw_compat_2_11[] = {
-    { "hpet", "hpet-offset-saved", "false" },
-    { "virtio-blk-pci", "vectors", "2" },
-    { "vhost-user-blk-pci", "vectors", "2" },
-    { "e1000", "migrate_tso_props", "off" },
-};
-const size_t hw_compat_2_11_len = G_N_ELEMENTS(hw_compat_2_11);
-
 MachineState *current_machine;
 
 static char *machine_get_kernel(Object *obj, Error **errp)
-- 
2.47.1


