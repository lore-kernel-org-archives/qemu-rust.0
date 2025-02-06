Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tfzr0-0002F7-CX
	for mharc-qemu-rust@gnu.org; Thu, 06 Feb 2025 06:15:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tfzqu-0002Dm-Ua
 for qemu-rust@nongnu.org; Thu, 06 Feb 2025 06:15:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tfzqs-0003de-EG
 for qemu-rust@nongnu.org; Thu, 06 Feb 2025 06:15:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738840521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=m77f0bUtjRDH0qejNFTZ2BDHt8Yr4jUi+cc/tAawOcA=;
 b=Usoc4vnKtTf5qoW9k4puoIat75/4HGODupuFkMBg89MQFyzbDpMv3y/WmRdKrUScCs0KYW
 fzfRAHVABC7rPu+5INy5Wq5TnFhQCtkhETGhdBTWNnuSqg+qA4hLVBJpnBFmZcetqiWLNL
 kAGUsR/pCwyoFrEU8jcwLxhgLdZjGg4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-jvrP2EizPy609fHDuwM3ig-1; Thu, 06 Feb 2025 06:15:18 -0500
X-MC-Unique: jvrP2EizPy609fHDuwM3ig-1
X-Mimecast-MFC-AGG-ID: jvrP2EizPy609fHDuwM3ig
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-5dc5369fad7so910520a12.3
 for <qemu-rust@nongnu.org>; Thu, 06 Feb 2025 03:15:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738840516; x=1739445316;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m77f0bUtjRDH0qejNFTZ2BDHt8Yr4jUi+cc/tAawOcA=;
 b=c45nImSCCYtL78a7tmy1aE+1i9MsmOQ/4GippB5oStNbC4KMwfFARiYO4D/jgERKNJ
 WxqJ9zuXOl3gJyV7ZVeTgaInqI8Uwzic2R/0HGaEAGyTGmR7cai2Uo3gCMJikWMVYHop
 t8xWKNfq7Y8lS+PZYUlWjZdnUz9dyrYPuo4ZBwEluPuTRMJn05asRyvdajPEgVmT3Qts
 Fj5CrEXCupA0GZnAZYAFD0j277MHfQB9YvZqZb5X8vCXuuq7UCBAVw67RjHIQ/YsPH7y
 e83MVVT/AHV5W5PxTrCNgF/j+7fmgDOVb3+mv9IHk5w6XUv8AC+Gu1nqJvXDjWob738s
 wb9w==
X-Gm-Message-State: AOJu0YzcDrmIFF/9BwMRRi1KDzbymPkn3FnZ0csbDrjfiv8qwzPsJd2j
 537rp/BxyFLdEAhIvCgUsDhpJjb/8l4zXzMEvU90Q57P6N6laEEPU3VXb53/cCWQvxkUNqmUd99
 SLA4lUqiU/VGpOMyDb1q7zegLCdUdxKDizQUbUlAu9upGns2trHRlZTq17UIGEg==
X-Gm-Gg: ASbGncsw00w14+IYcqgacWo+isVcl/jjQg4q6Lm0pL0eE3SQ7YiTBohTiIDyfPWaNqn
 a3NPu7AbYJfPpV0jKcjVQC/Ch1WzbaMm16/ofC/lCFbxRcyZ7s5WQ5PwI3Kyqj4e9ni6t7sumNm
 dDEmFQz7zBqWV5NSLARm7QZOkU/BGS+zXyJkbB0WmO5x8B3pnx6mW8TSp48URG13MmzZNx5fC42
 kniYbI2HqDVCrcizFHgeR5GxiItoY6PVEaFLztv/lCSPchbUt0LheIuQQOWqBaSFEf6litk/pKd
 tMUcbA==
X-Received: by 2002:a05:6402:40c5:b0:5da:7f7:b9b2 with SMTP id
 4fb4d7f45d1cf-5dcdb732c11mr7703750a12.18.1738840516460; 
 Thu, 06 Feb 2025 03:15:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFXFiJfbo/Z5iMfloeMglLdqgr5BpeKwIf2TdFBqn5bf67d0vO+ehcJSOY1gfhuhCCJc8Jpw==
X-Received: by 2002:a05:6402:40c5:b0:5da:7f7:b9b2 with SMTP id
 4fb4d7f45d1cf-5dcdb732c11mr7703699a12.18.1738840516047; 
 Thu, 06 Feb 2025 03:15:16 -0800 (PST)
Received: from [192.168.10.3] ([151.62.97.55])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dcf1b739e2sm692506a12.14.2025.02.06.03.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 03:15:15 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	qemu-stable@nongnu.org
Subject: [PATCH] rust: add --rust-target option for bindgen
Date: Thu,  6 Feb 2025 12:15:13 +0100
Message-ID: <20250206111514.2134895-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SyEaiHkCXPzo6hlHNj5gkardDUdfL8XZkvzIWwH6U4w_1738840517
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 06 Feb 2025 11:15:26 -0000

Without it, recent bindgen will give an error

   error: extern block cannot be declared unsafe

if rustc is not new enough to support the "unsafe extern" construct.

Cc: qemu-rust@nongnu.org
Cc: qemu-stable@nongnu.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meson.build b/meson.build
index 2c9ac9cfe1e..131b2225ab6 100644
--- a/meson.build
+++ b/meson.build
@@ -4054,6 +4054,9 @@ if have_rust
       bindgen_args += ['--formatter', 'none']
     endif
   endif
+  if bindgen.version().version_compare('>=0.66.0')
+    bindgen_args += ['--rust-target', '1.59']
+  endif
   if bindgen.version().version_compare('<0.61.0')
     # default in 0.61+
     bindgen_args += ['--size_t-is-usize']
-- 
2.48.1


