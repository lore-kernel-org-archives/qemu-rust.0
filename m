Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uAcus-0008UP-6y
	for mharc-qemu-rust@gnu.org; Thu, 01 May 2025 19:02:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uAcuq-0008TJ-KN
 for qemu-rust@nongnu.org; Thu, 01 May 2025 19:02:04 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uAcuo-0002Ek-CM
 for qemu-rust@nongnu.org; Thu, 01 May 2025 19:02:04 -0400
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3d81cba18e1so10971985ab.3
 for <qemu-rust@nongnu.org>; Thu, 01 May 2025 16:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746140521; x=1746745321; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F6iyIP6KaylLefLyBXHs1NcGKwBb7ZXW8SZqY1Ujxgs=;
 b=NqJtI6WPG61O0gHWSJlB+iHHyqUvyVR1ZkW25/cY/hnNLjfXnHD7N/6j8anyiSuaFU
 YuZZ8n0SewUFinmyUu2MZIny4hcJoy0YeKiUBeRMLv1f1JZOjhfED1l9GC+qzP1mY0Jn
 IlYvoqtsCI4u6akvV1jgyqXxKZUOZ7Xn2jjxqkuVilfMZu693BPsai1G3BgMNhS7iT+q
 KUqQ+sXvqGtwo7/IS4cQP4LtPQ+3zLGAS+WzziMFjSC3RIRubiYA1PEm++fyp7pH3DXf
 O48JkvK9N26G73d1ngQQsNXNGeyN588B7ne0MD6eGHpGHPi8vzUt0+o+7Bn9c2cK9fKO
 Ef9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746140521; x=1746745321;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F6iyIP6KaylLefLyBXHs1NcGKwBb7ZXW8SZqY1Ujxgs=;
 b=Bkjt6uy3rec+u6wbD4D0HzHhP2jVZPnvV6QVphseddeH8DbInHT47SEHAN6f9aMsM6
 WYjU2bnBhrdWLnewR/Ac0+R9wXwXJJwlh7XQz9Ml01W9P/NZWkbW8Ddo/LIRAwK4uR5U
 AFLbai6BTqKHy2gNPliDRqSBSw293J03It/Wm/yeUNLlVu2d2w/8eWiRkLVA1Ofdq0DM
 P1EC5SAxqsvXIgGCNu36viNcNDCF/WZFfOHveeqEJxaLk8w9DKYDStAb+jZORsRDeIXS
 eYJy9pjVbOXdsR38m+rADLcXj3R4kkwilE34O2hymInTh/z43dUeJYe55GZle7daXaZ2
 bR9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVH36ESCAP9nSYgysEP3kpHif5i4k4KThFXmaAuqEzjjDy9SXtZqyzb3ZwPiTgF4atF63KZn1oT4Sk=@nongnu.org
X-Gm-Message-State: AOJu0YxBnHTy+8pobl9G2WH90FZ3bdcbIl3lbpGRhKuopjYH8QKAyteA
 udw62wGm53aGtLOxI97606NilIVHREW6TcVT6Nfjtr9c0ld5Tukz4jZEFg7NXDg=
X-Gm-Gg: ASbGncsw3ecSkWJPe5nE7jlkfP0NVCr3WMHD1XXNOJcgNBttKDoE8z/KvG7ExLfWn7U
 4ABJmr8++EURY4tau5jIgppqFu1+u5xw9Pfp2EtUzOhKfasE+IYvbCMAxuPKWZeCGKEA9nGQgvP
 ShW4JdruFAMgVj1Bo7d4NYK/m3B6Mdl4lIOQ8aOz51lIVvBJ6JKC3c/EmzZTDSf/Jlzduty4rdJ
 fGKooPerRKZrRzvNmdbsSq2s4Nwa8U6A70axjLJ+OZH8zqb4mg6AHsvXhEd2feji84G3Pk/NREp
 xV2WdcBMC5UQNHBLvK1nOW9PNl0bS2B2FgLbUfzi1xlg/WDF+VZEMVXXhPKIsItybVqdD6kbiCd
 4/NJKM1/SsIMx7kZhY5LD
X-Google-Smtp-Source: AGHT+IH95z8u90I9wNs9KSFDwx5ReseCvnWier+V7CDTEewnDP6kWftkeQTo7Uc7k+YVgaSmW5mMqA==
X-Received: by 2002:a05:6e02:1a8f:b0:3d8:1d7c:e192 with SMTP id
 e9e14a558f8ab-3d97c196082mr10106525ab.7.1746140520957; 
 Thu, 01 May 2025 16:02:00 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4f88aac7e1asm87042173.135.2025.05.01.16.01.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 01 May 2025 16:02:00 -0700 (PDT)
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
Subject: [PATCH 03/10] hw/input/virtio-input: Remove
 VirtIOInputHID::wheel_axis field
Date: Fri,  2 May 2025 01:01:21 +0200
Message-ID: <20250501230129.2596-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250501230129.2596-1-philmd@linaro.org>
References: <20250501230129.2596-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=philmd@linaro.org; helo=mail-il1-x12b.google.com
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
X-List-Received-Date: Thu, 01 May 2025 23:02:05 -0000

The VirtIOInputHID::wheel_axis boolean was only set in the
hw_compat_2_10[] array, via the 'wheel-axis=false' property.
We removed all machines using that array, lets remove that
property and all the code around it. There is only one
virtio_input_config[] version for each device, rename it
removing the '_v2' suffix.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/virtio/virtio-input.h |   1 -
 hw/input/virtio-input-hid.c      | 102 ++-----------------------------
 2 files changed, 5 insertions(+), 98 deletions(-)

diff --git a/include/hw/virtio/virtio-input.h b/include/hw/virtio/virtio-input.h
index e097b0b5217..1e94f8a03db 100644
--- a/include/hw/virtio/virtio-input.h
+++ b/include/hw/virtio/virtio-input.h
@@ -89,7 +89,6 @@ struct VirtIOInputHID {
     const QemuInputHandler            *handler;
     QemuInputHandlerState             *hs;
     int                               ledstate;
-    bool                              wheel_axis;
 };
 
 struct VirtIOInputHost {
diff --git a/hw/input/virtio-input-hid.c b/hw/input/virtio-input-hid.c
index d986c3c16e3..a89a5b10c63 100644
--- a/hw/input/virtio-input-hid.c
+++ b/hw/input/virtio-input-hid.c
@@ -81,7 +81,6 @@ static void virtio_input_extend_config(VirtIOInput *vinput,
 static void virtio_input_handle_event(DeviceState *dev, QemuConsole *src,
                                       InputEvent *evt)
 {
-    VirtIOInputHID *vhid = VIRTIO_INPUT_HID(dev);
     VirtIOInput *vinput = VIRTIO_INPUT(dev);
     virtio_input_event event;
     int qcode;
@@ -109,8 +108,7 @@ static void virtio_input_handle_event(DeviceState *dev, QemuConsole *src,
         break;
     case INPUT_EVENT_KIND_BTN:
         btn = evt->u.btn.data;
-        if (vhid->wheel_axis &&
-            (btn->button == INPUT_BUTTON_WHEEL_UP ||
+        if ((btn->button == INPUT_BUTTON_WHEEL_UP ||
              btn->button == INPUT_BUTTON_WHEEL_DOWN) &&
             btn->down) {
             event.type  = cpu_to_le16(EV_REL);
@@ -328,32 +326,7 @@ static const QemuInputHandler virtio_mouse_handler = {
     .sync  = virtio_input_handle_sync,
 };
 
-static struct virtio_input_config virtio_mouse_config_v1[] = {
-    {
-        .select    = VIRTIO_INPUT_CFG_ID_NAME,
-        .size      = sizeof(VIRTIO_ID_NAME_MOUSE),
-        .u.string  = VIRTIO_ID_NAME_MOUSE,
-    },{
-        .select    = VIRTIO_INPUT_CFG_ID_DEVIDS,
-        .size      = sizeof(struct virtio_input_devids),
-        .u.ids     = {
-            .bustype = const_le16(BUS_VIRTUAL),
-            .vendor  = const_le16(0x0627), /* same we use for usb hid devices */
-            .product = const_le16(0x0002),
-            .version = const_le16(0x0001),
-        },
-    },{
-        .select    = VIRTIO_INPUT_CFG_EV_BITS,
-        .subsel    = EV_REL,
-        .size      = 1,
-        .u.bitmap  = {
-            (1 << REL_X) | (1 << REL_Y),
-        },
-    },
-    { /* end of list */ },
-};
-
-static struct virtio_input_config virtio_mouse_config_v2[] = {
+static struct virtio_input_config virtio_mouse_config[] = {
     {
         .select    = VIRTIO_INPUT_CFG_ID_NAME,
         .size      = sizeof(VIRTIO_ID_NAME_MOUSE),
@@ -379,26 +352,13 @@ static struct virtio_input_config virtio_mouse_config_v2[] = {
     { /* end of list */ },
 };
 
-static const Property virtio_mouse_properties[] = {
-    DEFINE_PROP_BOOL("wheel-axis", VirtIOInputHID, wheel_axis, true),
-};
-
-static void virtio_mouse_class_init(ObjectClass *klass, const void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-
-    device_class_set_props(dc, virtio_mouse_properties);
-}
-
 static void virtio_mouse_init(Object *obj)
 {
     VirtIOInputHID *vhid = VIRTIO_INPUT_HID(obj);
     VirtIOInput *vinput = VIRTIO_INPUT(obj);
 
     vhid->handler = &virtio_mouse_handler;
-    virtio_input_init_config(vinput, vhid->wheel_axis
-                             ? virtio_mouse_config_v2
-                             : virtio_mouse_config_v1);
+    virtio_input_init_config(vinput, virtio_mouse_config);
     virtio_input_extend_config(vinput, keymap_button,
                                ARRAY_SIZE(keymap_button),
                                VIRTIO_INPUT_CFG_EV_BITS, EV_KEY);
@@ -409,7 +369,6 @@ static const TypeInfo virtio_mouse_info = {
     .parent        = TYPE_VIRTIO_INPUT_HID,
     .instance_size = sizeof(VirtIOInputHID),
     .instance_init = virtio_mouse_init,
-    .class_init    = virtio_mouse_class_init,
 };
 
 /* ----------------------------------------------------------------- */
@@ -421,44 +380,7 @@ static const QemuInputHandler virtio_tablet_handler = {
     .sync  = virtio_input_handle_sync,
 };
 
-static struct virtio_input_config virtio_tablet_config_v1[] = {
-    {
-        .select    = VIRTIO_INPUT_CFG_ID_NAME,
-        .size      = sizeof(VIRTIO_ID_NAME_TABLET),
-        .u.string  = VIRTIO_ID_NAME_TABLET,
-    },{
-        .select    = VIRTIO_INPUT_CFG_ID_DEVIDS,
-        .size      = sizeof(struct virtio_input_devids),
-        .u.ids     = {
-            .bustype = const_le16(BUS_VIRTUAL),
-            .vendor  = const_le16(0x0627), /* same we use for usb hid devices */
-            .product = const_le16(0x0003),
-            .version = const_le16(0x0001),
-        },
-    },{
-        .select    = VIRTIO_INPUT_CFG_EV_BITS,
-        .subsel    = EV_ABS,
-        .size      = 1,
-        .u.bitmap  = {
-            (1 << ABS_X) | (1 << ABS_Y),
-        },
-    },{
-        .select    = VIRTIO_INPUT_CFG_ABS_INFO,
-        .subsel    = ABS_X,
-        .size      = sizeof(virtio_input_absinfo),
-        .u.abs.min = const_le32(INPUT_EVENT_ABS_MIN),
-        .u.abs.max = const_le32(INPUT_EVENT_ABS_MAX),
-    },{
-        .select    = VIRTIO_INPUT_CFG_ABS_INFO,
-        .subsel    = ABS_Y,
-        .size      = sizeof(virtio_input_absinfo),
-        .u.abs.min = const_le32(INPUT_EVENT_ABS_MIN),
-        .u.abs.max = const_le32(INPUT_EVENT_ABS_MAX),
-    },
-    { /* end of list */ },
-};
-
-static struct virtio_input_config virtio_tablet_config_v2[] = {
+static struct virtio_input_config virtio_tablet_config[] = {
     {
         .select    = VIRTIO_INPUT_CFG_ID_NAME,
         .size      = sizeof(VIRTIO_ID_NAME_TABLET),
@@ -503,26 +425,13 @@ static struct virtio_input_config virtio_tablet_config_v2[] = {
     { /* end of list */ },
 };
 
-static const Property virtio_tablet_properties[] = {
-    DEFINE_PROP_BOOL("wheel-axis", VirtIOInputHID, wheel_axis, true),
-};
-
-static void virtio_tablet_class_init(ObjectClass *klass, const void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-
-    device_class_set_props(dc, virtio_tablet_properties);
-}
-
 static void virtio_tablet_init(Object *obj)
 {
     VirtIOInputHID *vhid = VIRTIO_INPUT_HID(obj);
     VirtIOInput *vinput = VIRTIO_INPUT(obj);
 
     vhid->handler = &virtio_tablet_handler;
-    virtio_input_init_config(vinput, vhid->wheel_axis
-                             ? virtio_tablet_config_v2
-                             : virtio_tablet_config_v1);
+    virtio_input_init_config(vinput, virtio_tablet_config);
     virtio_input_extend_config(vinput, keymap_button,
                                ARRAY_SIZE(keymap_button),
                                VIRTIO_INPUT_CFG_EV_BITS, EV_KEY);
@@ -533,7 +442,6 @@ static const TypeInfo virtio_tablet_info = {
     .parent        = TYPE_VIRTIO_INPUT_HID,
     .instance_size = sizeof(VirtIOInputHID),
     .instance_init = virtio_tablet_init,
-    .class_init    = virtio_tablet_class_init,
 };
 
 /* ----------------------------------------------------------------- */
-- 
2.47.1


