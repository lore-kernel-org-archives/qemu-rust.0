Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1td3Jv-0006O1-GS
	for mharc-qemu-rust@gnu.org; Wed, 29 Jan 2025 03:21:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1td3Jh-0006KI-Mz
 for qemu-rust@nongnu.org; Wed, 29 Jan 2025 03:20:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1td3Jg-0004Eq-Cl
 for qemu-rust@nongnu.org; Wed, 29 Jan 2025 03:20:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738138854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kmWDchkgNMCOHLnNxHT63tYJxxCZKeV/TOaAclkBW9w=;
 b=HPMD65ro9t0yP7ZXNo00iI30Ft+efyUwmE5/75fEWoNm7Hal64QFfZkVwwigfLuPfUhpsx
 wwTqEMHIDFOy06EW1jV6kaP+hOeVfl1HCD34g4fUb+2/FJ43QEtIMiPZdqntOgBhn5KMid
 gC/beAiZdlwdFGEAQEizvWIRlOkos9c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-XqkpOUbcNXq0KnmrEbIGUg-1; Wed, 29 Jan 2025 03:20:48 -0500
X-MC-Unique: XqkpOUbcNXq0KnmrEbIGUg-1
X-Mimecast-MFC-AGG-ID: XqkpOUbcNXq0KnmrEbIGUg
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4361eb83f46so50947495e9.3
 for <qemu-rust@nongnu.org>; Wed, 29 Jan 2025 00:20:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738138847; x=1738743647;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kmWDchkgNMCOHLnNxHT63tYJxxCZKeV/TOaAclkBW9w=;
 b=dhzSyNdIWXlLvQmaX64dAEo83OAYuT/VrHk9Gg9nbCd8DXHjZ+rV66t+/oR54sj0tq
 n2+vbQknYB4OQA8sh+andfn1Futma96QXnJ2T3zXKQxqdRQ7s4sdIIkxMm+c0UKN01Q2
 Hghpzjjmzyoa9IQCy+k5ffg/uaEM3PtukyfiD9GRxcoamENJuaOxe5CX2gnhgb0vyRH5
 JPFKc6DOcvWFD1NokAC3cy6c6UW6gly8bAdH6mZ+cGHolkRfJUAtgElfjWFaFxYQChuJ
 rdlcqxPzTEulCU/dOmelGjECdy57Ifk6mLS8horhLydW32sfkoxTvzTNghknuF8JU63h
 i7NA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAgZKmVkV1j9TIoqbDtwNJXHNuyWoQiCjuY2YJ/WVgH3g7GW7lGwvuVGw90pw/JoK8zHIctX75j1Q=@nongnu.org
X-Gm-Message-State: AOJu0YxbJ8ZHyhz4jaIDTJhUgqNUkKNZvv1q4gK4+uaWwzqxCE12R1Jq
 XDh8lGwcCatjlyyQAYc2842lYE8wDQQWvKKJHv568BHbHDNm00LCT1unzm9eQsg6kwPZd4kxErc
 UZERgkq0TiztPwYB1Yrj7hMMX4NHlyr3ZmkoPN64Is5nqMLR+/NA=
X-Gm-Gg: ASbGncsaxHb65gjaAhWfk6fgsYsEbU8LVSbJjaA9rxvn7VqdOVmTkGdrdyrYW81LlMt
 xyFVYg2bIslSqeFXLGiGmQ6z5ro2qNtr+/CrEP0oSBuPx76WVmsD+mCfNLJ1ahFe2EJhzSDXYJ5
 pIvC8gsixVYNSWBDsSYUGLaAEGwsx2Dm6GyiwlWXYLTaFzGziD0gYWjiSK3dvVAmlWi9HVWCkJj
 q5qrE3lMESwq90Mska8KTpGymtUEHtG2VWKBwhvlgugV07//J/BsDThhOWXHrdigX6Vr/b0Xbtr
 mfhOEg==
X-Received: by 2002:a05:600c:1d1e:b0:436:ed33:1535 with SMTP id
 5b1f17b1804b1-438dc3bf129mr15945225e9.12.1738138847053; 
 Wed, 29 Jan 2025 00:20:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEweJxqvsTxtpXAZYVjRsKDWKJMu638NkLjAIdF/obghHTcAmSBVPrca+kwQ+jgaANhjGsSgw==
X-Received: by 2002:a05:600c:1d1e:b0:436:ed33:1535 with SMTP id
 5b1f17b1804b1-438dc3bf129mr15945025e9.12.1738138846761; 
 Wed, 29 Jan 2025 00:20:46 -0800 (PST)
Received: from [192.168.10.3] ([151.62.97.55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc6de7csm13675845e9.32.2025.01.29.00.20.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 00:20:46 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com,
	qemu-rust@nongnu.org
Subject: [PATCH] gitlab-ci: include full Rust backtraces in test runs
Date: Wed, 29 Jan 2025 09:20:45 +0100
Message-ID: <20250129082045.1319203-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: u_1MMfuL-Aa_dUoR7vDTD8gR0K5QbtmX8bV-pRAiijg_1738138847
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.3,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 29 Jan 2025 08:20:58 -0000

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .gitlab-ci.d/buildtest-template.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
index 39da7698b09..4cc19239319 100644
--- a/.gitlab-ci.d/buildtest-template.yml
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -63,6 +63,7 @@
   stage: test
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:$QEMU_CI_CONTAINER_TAG
   script:
+    - export RUST_BACKTRACE=1
     - source scripts/ci/gitlab-ci-section
     - section_start buildenv "Setting up to run tests"
     - scripts/git-submodule.sh update roms/SLOF
-- 
2.48.1


