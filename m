Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1thR0E-0002K1-At
	for mharc-qemu-rust@gnu.org; Mon, 10 Feb 2025 05:26:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thR06-00022Z-71
 for qemu-rust@nongnu.org; Mon, 10 Feb 2025 05:26:51 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thR03-0001uL-Cs
 for qemu-rust@nongnu.org; Mon, 10 Feb 2025 05:26:49 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-38dc660b56cso3066348f8f.0
 for <qemu-rust@nongnu.org>; Mon, 10 Feb 2025 02:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739183205; x=1739788005; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Erd1QRkWHF7+o7fUlnkpAnDL5/T6KyPLOu6vW8OnIM0=;
 b=HK+AY82hQt9L1pBvfsEzc7iX/YgS44rsW5KG0lrlW7FbnvBD9Mf2fL24GJvQ8sgJ4V
 fbPAIZs61Ix1emgCzkIU0DbTgsvc65QRX3zex0682TWc6jqBQWBFIcd1Ts+9qajbP7RH
 4rdiT26ph1JgtRPM773NS1nCzLvIQLA6sBErjEj0X98xFKFMB4uWhjje1Mfk74BzmahF
 pTE6mqtzAd8JuhvdnMJRtDZq2KzBg933aMRoaUfoRLP7jmVXGUhZB8HFgPEOzKEWWj9/
 kwiQcKwMPnmJV+dCUhdX5Qxi1+Nrk6zpk7r4BkBQFkzTW9Js25C+FNsBqiFrDOQPS5Dw
 fYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739183205; x=1739788005;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Erd1QRkWHF7+o7fUlnkpAnDL5/T6KyPLOu6vW8OnIM0=;
 b=wOUa9TRUqhg7SASS+CfG4aKz69tNe0mebN3TSMpwca8Ntly4MFfEcFX0ccDGK7+XSH
 Nq/APRBJ82ahPLM+ISGU+7KnRNuUpJ8U7ru2BwLkXMXTZVsVvMvynHbUZwfrh/0mLefm
 V+NfAC8lv+qJJrxGWOE7rSRL10ctC1JXopVcEnXzxoj7vgaTnLQd3vk5O4tzc6e9lfTj
 W5hiTZMEtj0Co6Bg9/Xg86vJlqXIIwIts2cNLBmghZuneKMrtOO5loVk5nlpAr1754Ly
 kZUzJ+6w81J2tWkwCUa4bKmAS7tZwaAn0w5F2qZQwZaMv5vHAa5s2p3H6u1Me5N3eAIW
 K7eA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUv+vqzGsKmGyCxtiFNOQnT2O4TtGzNr4aHgPUrMsa6cPJ02JwTNbONKM4nLt3d5ik5LFsgRZRejIc=@nongnu.org
X-Gm-Message-State: AOJu0YzPIX1XlPrwuKNWj7hBFuUWl5fAKeqY350sF4pDDkvmwuJ/1ibo
 ER1m+o2RsKhvFfwH8aB6XvBYwYc5x3cfBXFQPqAIu7wDxvhnhaSgpc4OXbhaACI=
X-Gm-Gg: ASbGnctO+5DQE9WvocYHxIEeOjaeqNXlshLjfQDlUFs4jmeCnUVrouo4FHNahrdcU4i
 iol8wr8kjSx0S51XekLNPp6dUhICJXJ0EBgHgyuw0X66d0X2fvUnjwRIz2UQAQ8hoxMYTXhdYeo
 ff9A6fSQKyEMcIvGQR6TRZnR9mPKNq9TeyfWCuObg6lyLlm/D1H0rHN7JAKof+MZw983LGfeUWz
 Ej7n/nkA/t8FXK9nRChL5luBE/8P+eqdU3oZmnaUL+N70vGFGNtgMOUT8eH+qXnPXR651vTqyD8
 hQLeYcjabjQ8dNU86my4J6wHurynoBFlp5gA2bCpo5T7IKtV1MTLj5FzF0oCu/lNfnB2yvk=
X-Google-Smtp-Source: AGHT+IGkcyRXsDlZmHOSwTA8vWBQY2CQMa1BhV6A6MxHJnEF1KBn7JSycjoZqxmkLg7tJ4cuk/VRiw==
X-Received: by 2002:a05:6000:1889:b0:38d:cab2:921a with SMTP id
 ffacd0b85a97d-38dcab294b5mr9187155f8f.1.1739183204966; 
 Mon, 10 Feb 2025 02:26:44 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc88989b5sm9669827f8f.65.2025.02.10.02.26.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 10 Feb 2025 02:26:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-rust@nongnu.org
Subject: [PATCH 08/10] qom: Have class_base_init() take a const data argument
Date: Mon, 10 Feb 2025 11:26:02 +0100
Message-ID: <20250210102604.34284-9-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250210102604.34284-1-philmd@linaro.org>
References: <20250210102604.34284-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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
X-List-Received-Date: Mon, 10 Feb 2025 10:26:52 -0000

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Cc: qemu-rust@nongnu.org
---
 include/qom/object.h | 2 +-
 hw/core/machine.c    | 2 +-
 hw/core/qdev.c       | 2 +-
 hw/pci/pci.c         | 2 +-
 qom/object.c         | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index 9192265db76..7bb14ca7067 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -487,7 +487,7 @@ struct TypeInfo
     size_t class_size;
 
     void (*class_init)(ObjectClass *klass, void *data);
-    void (*class_base_init)(ObjectClass *klass, void *data);
+    void (*class_base_init)(ObjectClass *klass, const void *data);
     void *class_data;
 
     InterfaceInfo *interfaces;
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 254cc20c4cb..7bdde9286c2 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1236,7 +1236,7 @@ static void machine_class_init(ObjectClass *oc, void *data)
         "Memory size configuration");
 }
 
-static void machine_class_base_init(ObjectClass *oc, void *data)
+static void machine_class_base_init(ObjectClass *oc, const void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
     mc->max_cpus = mc->max_cpus ?: 1;
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 82bbdcb654e..54578299147 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -693,7 +693,7 @@ static void device_finalize(Object *obj)
     g_free(dev->id);
 }
 
-static void device_class_base_init(ObjectClass *class, void *data)
+static void device_class_base_init(ObjectClass *class, const void *data)
 {
     DeviceClass *klass = DEVICE_CLASS(class);
 
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 2afa423925c..00f50e6f2cc 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2712,7 +2712,7 @@ static void pci_device_class_init(ObjectClass *klass, void *data)
         "access to indirect DMA memory");
 }
 
-static void pci_device_class_base_init(ObjectClass *klass, void *data)
+static void pci_device_class_base_init(ObjectClass *klass, const void *data)
 {
     if (!object_class_is_abstract(klass)) {
         ObjectClass *conventional =
diff --git a/qom/object.c b/qom/object.c
index ec447f14a78..61ac8cd4842 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -55,7 +55,7 @@ struct TypeImpl
     size_t instance_align;
 
     void (*class_init)(ObjectClass *klass, void *data);
-    void (*class_base_init)(ObjectClass *klass, void *data);
+    void (*class_base_init)(ObjectClass *klass, const void *data);
 
     void *class_data;
 
-- 
2.47.1


