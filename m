Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uAcuc-0008ND-Ox
	for mharc-qemu-rust@gnu.org; Thu, 01 May 2025 19:01:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uAcua-0008MF-4W
 for qemu-rust@nongnu.org; Thu, 01 May 2025 19:01:48 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uAcuW-0002B1-Qf
 for qemu-rust@nongnu.org; Thu, 01 May 2025 19:01:47 -0400
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3d96d16b375so8000425ab.1
 for <qemu-rust@nongnu.org>; Thu, 01 May 2025 16:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746140503; x=1746745303; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UogoyiXW138ZEeb+2tt0PHdIw32Ugidt6sz27K9+AA8=;
 b=Lf09V9GTaMp9gDdB7CZonsOL/2HQ1O3tQk4uzf9vnau/9Af3UWL4nxXd657KjYqmIk
 UpKXam7XmY4YJkwq2cGFOaOOeg75ShWgfS6iX1uYPUp50ajQcfk8lnsWD0w2waXDz/WO
 9p0dpZ2dbnD2vo0lQ6rIJpe5lMHhWFeLJl+GY8sIjkDYWYGDY0gJi5fYIstGx//gqksP
 0m7G8A0mPga2U6+uA5tinZk33PBr5lo8PxYNQR78U6LpiDHAjZfZic3P2t2OkzV5F/QW
 KriToO6YYIyoIEb3DPQUSjRHq8qux3K75pLp6eGZOReEcc2ShOg5MapNDwij0mXuw8sd
 W6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746140503; x=1746745303;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UogoyiXW138ZEeb+2tt0PHdIw32Ugidt6sz27K9+AA8=;
 b=SJlGXaBZ3NckSlnQnyfcuEpVyTmWuj5jTrgQ91Xe101V4q3fkJiK5lCngOaOjOWmbL
 kRQUBZVX94S2g/cKUA7K8K4IIuuOPauanpbAoV9tipqDEOmnrgHXPuoj9L5X3j3UmeRy
 ER7m1e3K8SNmGP7aZvg6kUF7z6zlauWHBd1FOrDPVpMzmB0+/oq6N7BiHfbl3sneD2f/
 ELFyS+0c1SGomlUHFrMOoBbO/yFMjkINTs7Mh8qiVVhWM0Ah6k5E2OhOFec4hJTEn4IS
 sOiuKCIm4grVgwzb49zCmaEjzq1GyQIAdoYwFOIKoZDtL1JOpLUs/jhDB+y/ANfqk9DW
 engA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWE5cN/0yfcZ5HqDihTF24EGTZa15yFP4Zp+gASqsSRhEmCEYe849P86WehRBZMsUvhbH97Vu31ojI=@nongnu.org
X-Gm-Message-State: AOJu0YwZU3I7bps5Zy6o0tZyv1rmUDqIlQv5D1huK8XuvJpDRtL2B+z7
 wvAPjp6FQUk6TMVEBCPOAah7daYVcXaqJbhz8EdQEG3RsxguTUDFGnjY69r458M=
X-Gm-Gg: ASbGncsC2+z4DkjUloqVI96IjHapRPODv8Q7L9/ggYujaSAXq0UeF7raow+Ko7YLhWv
 1nqY19EIT0nLzVw/qtU4hLc518l72aGofxyFMosKTrV04sZyioWGTRj35x7hr4nqB+sQb5ITcxv
 5VrLn5NSIc8mtrqEme1yEHELAzUpY1vuXfZX9WFRR00cpmpX2aPrXEJ/WK2WlZ18OFJZrcT1iz9
 FY0kMoWLMKCF7K9QHnRzxPg32tfd7AW6vHs91OhuD15ihZQCetL0EEtV3pLVfPEiGDq/DzxFJfg
 4gjR9Ha0AXKQblED4HF+/d5/fn0IRRdKFtBa0yfmxFlcliz56fJsdCOGwz4XunX0vznX8o8OTYR
 MnlFRPcB6aEOCbBnBPBjZ
X-Google-Smtp-Source: AGHT+IGIL0oPhv4toXK2RGB4CmhDijzyGCYQr701oKU23cJlJ54pR+dxGy3DVizBUKUNi2hsZWAU9Q==
X-Received: by 2002:a05:6e02:18c8:b0:3d6:cd54:ba53 with SMTP id
 e9e14a558f8ab-3d97c26091bmr10181675ab.22.1746140503334; 
 Thu, 01 May 2025 16:01:43 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4f88aac7e1asm86910173.135.2025.05.01.16.01.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 01 May 2025 16:01:42 -0700 (PDT)
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
Subject: [PATCH 01/10] hw/s390x/s390-virtio-ccw: Remove the deprecated 2.10
 and 2.11 machine types
Date: Fri,  2 May 2025 01:01:19 +0200
Message-ID: <20250501230129.2596-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250501230129.2596-1-philmd@linaro.org>
References: <20250501230129.2596-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::135;
 envelope-from=philmd@linaro.org; helo=mail-il1-x135.google.com
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
X-List-Received-Date: Thu, 01 May 2025 23:01:48 -0000

From: Thomas Huth <thuth@redhat.com>

They are older than 6 years, so according to our machine support
policy, they can be removed now.

There was not anything special in the 2.10 machine type, so just remove
it together with the 2.11 machine type. The 2.11 machine type switched
some configuration that needs additional cleanups in the following
patches.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20250115073819.15452-6-thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/s390x/s390-virtio-ccw.c | 37 -------------------------------------
 1 file changed, 37 deletions(-)

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 94edd42dd25..2c90702d834 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -1250,43 +1250,6 @@ static void ccw_machine_2_12_class_options(MachineClass *mc)
 }
 DEFINE_CCW_MACHINE(2, 12);
 
-#ifdef CONFIG_S390X_LEGACY_CPUS
-
-static void ccw_machine_2_11_instance_options(MachineState *machine)
-{
-    static const S390FeatInit qemu_cpu_feat = { S390_FEAT_LIST_QEMU_V2_11 };
-    ccw_machine_2_12_instance_options(machine);
-
-    /* before 2.12 we emulated the very first z900 */
-    s390_set_qemu_cpu_model(0x2064, 7, 1, qemu_cpu_feat);
-}
-
-static void ccw_machine_2_11_class_options(MachineClass *mc)
-{
-    static GlobalProperty compat[] = {
-        { TYPE_SCLP_EVENT_FACILITY, "allow_all_mask_sizes", "off", },
-    };
-
-    ccw_machine_2_12_class_options(mc);
-    compat_props_add(mc->compat_props, hw_compat_2_11, hw_compat_2_11_len);
-    compat_props_add(mc->compat_props, compat, G_N_ELEMENTS(compat));
-}
-DEFINE_CCW_MACHINE(2, 11);
-
-static void ccw_machine_2_10_instance_options(MachineState *machine)
-{
-    ccw_machine_2_11_instance_options(machine);
-}
-
-static void ccw_machine_2_10_class_options(MachineClass *mc)
-{
-    ccw_machine_2_11_class_options(mc);
-    compat_props_add(mc->compat_props, hw_compat_2_10, hw_compat_2_10_len);
-}
-DEFINE_CCW_MACHINE(2, 10);
-
-#endif
-
 static void ccw_machine_register_types(void)
 {
     type_register_static(&ccw_machine_info);
-- 
2.47.1


