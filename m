Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uAcvk-0000dl-JT
	for mharc-qemu-rust@gnu.org; Thu, 01 May 2025 19:03:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uAcvW-0000Uy-NJ
 for qemu-rust@nongnu.org; Thu, 01 May 2025 19:02:47 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uAcvU-0002Nv-Tp
 for qemu-rust@nongnu.org; Thu, 01 May 2025 19:02:46 -0400
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-8644aa73dfcso54224939f.0
 for <qemu-rust@nongnu.org>; Thu, 01 May 2025 16:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746140556; x=1746745356; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1dlMcx3WGtPJYiCrgyeoxnRKpVNt5eyt1XvaZehs/1U=;
 b=gsemxs7N9iAG6j8aEhfg3NtMsyc3G2GOGjVbvsX1DBgih+f+NQQjg6cULWydJHruzk
 eUwmrhqn1ln2JjrZFwY5KdM2TJFxYiLiNw4HMw7ozaZVj15oSxeOZFc7WJ58FoiraDks
 xq2ltZ5XwYYCLjHDQIfFseQFRqHh2bEQzhwXxAxyzJNPsfVB/7QkpuB/KCiru1ZMBoEB
 wmfVSpCK/+uWAhgFqYLFMZXmr9A4xt+PJHM4roXcf1FZUC15JOKtMFOxYC9zJx6PcmyD
 gA+U2L9zftobJVSPd2zUHbltQxHySRxFNZJWl76MpwFplS+p24vPSiglmo1D9iKoNv8c
 bxhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746140556; x=1746745356;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1dlMcx3WGtPJYiCrgyeoxnRKpVNt5eyt1XvaZehs/1U=;
 b=DbiedBl++VfmdL2SElQfNRYz0Fxg5eSyOOq9rCfq/PoWF12mUxZ4c19qvyq7yLebO7
 LQbSOjjBcaf3p42nYFlPiOCPH4NDRvgoLCB2axr10C8Z1/Wrms+5y2ibtVytWCHJbMeC
 peNk3dk9Qczj8iN41egzKgr1U84buoCbhFFtz/U7co2h0bKqv+ozqXtXjHPfuKGe/U1V
 Z6R3B2mCWK1sS7i6n2YgmoWQEZ51015v0bbN3r6KaaKZYYLYBa/MMAJGT0mYPO7GXTlk
 e6FyorPfpWVyt2N4yyKEh7fM9qdSQQKT7nfk4REmwlalylV4bsRuHuEH8R/LudFAWBW8
 hP6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWF9tvI/UPDlQCHeSvpNo6Fezev2tyrPDskaMDC+d8vyrl9wxV8RC4eTV4AvYfk3wCZbbMwVWR5rho=@nongnu.org
X-Gm-Message-State: AOJu0YwLzwIUuXBBhnwZXY+je8CyhQL6j1YwJ/JRtlP4+5VB+MCVt1eN
 OdrzqHNapwWLg9jDKxQNf+9+EsBfYIL4s5P8A6ayK10jrf5VjHN6EUtpGPZ+uDmOGey/5e0ijYX
 s
X-Gm-Gg: ASbGncv/nLFQskNYIp2r8JiSRUZug9klnKfWkTbBOvaJJI7dVdJraCL2PT8QauplKyG
 WBDKamKHtYoCuvcHgIjA2v1uy1ZEyqccKrTxjr1jVlfnZNjft6WqEt/HlfUTMl2WxeH5g+PmURs
 GeL9QDyRjePXNyevBQGxOeNJt+rtf8fuHpgPsBXbV9TAh0HJL5tMEJQbyknx6c1trDIUilf6FiM
 /Al00mVi0Git6tge64xIKgYvdPhZv6A4SBdqbT4l7xUeLk0cBG6Uhv2R+DLR1Xlnt6LmV4iGf+p
 eHZ9cM93iwb6qcL9p2CR0M7frOwL3W5oNQbEXiWz2gchTsIEiHPCnx1yK2Wl5pBbDnqzmXlgGuo
 Qjk5yC7sG8BkiBeZyQ9aT
X-Google-Smtp-Source: AGHT+IG3KJ8tW2veGSL0bNPTMdz4dp4JK0KNaJu7AV8FePfOrcHjR1Vw8E5ZFfIwibr3wznGzO2ljw==
X-Received: by 2002:a05:6e02:3702:b0:3d3:fbae:3978 with SMTP id
 e9e14a558f8ab-3d97c1a4cb9mr9373195ab.9.1746140555981; 
 Thu, 01 May 2025 16:02:35 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4f88aac7e27sm87432173.138.2025.05.01.16.02.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 01 May 2025 16:02:35 -0700 (PDT)
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
Subject: [PATCH 07/10] hw/s390x/s390-virtio-ccw: Remove the deprecated 2.12
 machine type
Date: Fri,  2 May 2025 01:01:25 +0200
Message-ID: <20250501230129.2596-8-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250501230129.2596-1-philmd@linaro.org>
References: <20250501230129.2596-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=philmd@linaro.org; helo=mail-io1-xd32.google.com
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
X-List-Received-Date: Thu, 01 May 2025 23:02:51 -0000

From: Thomas Huth <thuth@redhat.com>

The s390-ccw-virtio-2.12 machine is older than 6 years, so according to
our machine support policy, it can be removed now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20250115073819.15452-9-thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/s390x/s390-virtio-ccw.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 2c90702d834..e612030bc18 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -1236,20 +1236,6 @@ static void ccw_machine_3_0_class_options(MachineClass *mc)
 }
 DEFINE_CCW_MACHINE(3, 0);
 
-static void ccw_machine_2_12_instance_options(MachineState *machine)
-{
-    ccw_machine_3_0_instance_options(machine);
-    s390_cpudef_featoff_greater(11, 1, S390_FEAT_PPA15);
-    s390_cpudef_featoff_greater(11, 1, S390_FEAT_BPB);
-}
-
-static void ccw_machine_2_12_class_options(MachineClass *mc)
-{
-    ccw_machine_3_0_class_options(mc);
-    compat_props_add(mc->compat_props, hw_compat_2_12, hw_compat_2_12_len);
-}
-DEFINE_CCW_MACHINE(2, 12);
-
 static void ccw_machine_register_types(void)
 {
     type_register_static(&ccw_machine_info);
-- 
2.47.1


