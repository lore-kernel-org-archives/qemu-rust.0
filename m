Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tBzND-0006DY-26
	for mharc-qemu-rust@gnu.org; Fri, 15 Nov 2024 11:40:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tBzN9-0006Af-2N
 for qemu-rust@nongnu.org; Fri, 15 Nov 2024 11:40:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tBzN7-0002IP-7E
 for qemu-rust@nongnu.org; Fri, 15 Nov 2024 11:40:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731688835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q0jH9GG4Y9DVdkqF6zGXUYSm5Vmv2IR3Nw21G/qghzM=;
 b=MF4d1D3vABcP9dKG5lHXm0Il3zkC5ASoKGOdwy2AY9QRTmbYPDUUoAJ3TidfkdwQ/PMi/N
 NMT+uLqJA7HdlKhVZxdzKcxL8ON6PKrh+rOqRrRerYEDSNIX3XJQ8WGsxf9SDLGq+/JBCh
 LfK2HwslJjLhXYMvqLmA7iKoHFzRSTI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-340-7IoxMzOOPOuSncLnFxHiig-1; Fri, 15 Nov 2024 11:40:33 -0500
X-MC-Unique: 7IoxMzOOPOuSncLnFxHiig-1
X-Mimecast-MFC-AGG-ID: 7IoxMzOOPOuSncLnFxHiig
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43157e3521dso13717055e9.1
 for <qemu-rust@nongnu.org>; Fri, 15 Nov 2024 08:40:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731688827; x=1732293627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q0jH9GG4Y9DVdkqF6zGXUYSm5Vmv2IR3Nw21G/qghzM=;
 b=QLaZhFvLi21JeVtoZBNMKt4ZFoe0u20r09Ht0De4kT+QwEyK5rSKrgXUf8FAsKZm7b
 lcIjTJWKXJ/Z1PzfglKnP3K703/9jhuJVdm9WoWQGvoUZPvdWLTuEDNXis5qapT1ZtYK
 FBv0KPBbhnNxRaju2P0syu/8hubICLYj5UiPKO56mJbBjYXamT3JT0bBQvD0sBhpGHDE
 Euo7RgYcPnsZv095bKF+TyN/50fYOPJzvTBDxOpM76aEXBtZKtd9qEq54hMRv2iY8agd
 7TDDSXAhqI9ppNOKZM9s93aDBjOX7cIebDBh9JLi+dNaEJ8uYTfDr/IiIqoafe/aS8Ms
 WNQw==
X-Gm-Message-State: AOJu0YylrBO5Si/mgXcYVu/YtA7KF8ltiea/2lMqr2DQzappVJayHzDv
 OPWr2GBEmbly3ayLc/DqT1v8ZRe0hm3pALYE4l5xFcSF6IF9JjnqDBXXZMqecxZxO1VJOh9AHRx
 BHJ4hmJPDF1YFQ1Hn1/Hb004yayGP4uHQ+ZjqDfIyvCx8kzMsR7E=
X-Received: by 2002:a05:600c:c08:b0:432:7c08:d121 with SMTP id
 5b1f17b1804b1-432df741a8bmr31015945e9.12.1731688827272; 
 Fri, 15 Nov 2024 08:40:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBKskmKUgKodxYS6R/cBZhBf0NpqATQwq/de+/8v91CxLYcSq5FmIQyXdc0P7L+2GmjRASdA==
X-Received: by 2002:a05:600c:c08:b0:432:7c08:d121 with SMTP id
 5b1f17b1804b1-432df741a8bmr31015755e9.12.1731688826890; 
 Fri, 15 Nov 2024 08:40:26 -0800 (PST)
Received: from [192.168.10.3] ([151.49.84.243])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821ae31083sm4767995f8f.103.2024.11.15.08.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 08:40:26 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, berrange@redhat.com, junjie.mao@hotmail.com,
 manos.pitsidianakis@linaro.org, kwolf@redhat.com
Subject: [PATCH 01/12] rust: apply --cfg MESON to all crates
Date: Fri, 15 Nov 2024 17:40:14 +0100
Message-ID: <20241115164025.1917618-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115163944.1917393-1-pbonzini@redhat.com>
References: <20241115163944.1917393-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: trHe2o1ZOANdti1ELBdW78wH6gjebXuO-oT1Q6eZoNA_1731688832
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.12,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Fri, 15 Nov 2024 16:40:39 -0000

We might have more uses for --cfg MESON, even though right now it's only
qemu-api that has generated files.  Since we're going to add more flags
to the add_project_arguments calls for Rust, it makes sense to also add
--cfg MESON everywhere.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build               | 7 ++++---
 rust/qemu-api/meson.build | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meson.build b/meson.build
index e0b880e4e13..a6172524287 100644
--- a/meson.build
+++ b/meson.build
@@ -3422,10 +3422,11 @@ if have_rust
   # is safe; https://github.com/rust-lang/rust/pull/54675 says that
   # passing -nodefaultlibs to the linker "was more ideological to
   # start with than anything".
-  add_project_arguments(rustc_args + ['-C', 'default-linker-libraries'],
+  add_project_arguments(rustc_args +
+      ['--cfg', 'MESON', '-C', 'default-linker-libraries'],
       native: false, language: 'rust')
-
-  add_project_arguments(rustc_args, native: true, language: 'rust')
+  add_project_arguments(rustc_args + ['--cfg', 'MESON'],
+      native: true, language: 'rust')
 endif
 
 hxtool = find_program('scripts/hxtool')
diff --git a/rust/qemu-api/meson.build b/rust/qemu-api/meson.build
index 6f637af7b1b..cad9ac4844e 100644
--- a/rust/qemu-api/meson.build
+++ b/rust/qemu-api/meson.build
@@ -1,4 +1,4 @@
-_qemu_api_cfg = ['--cfg', 'MESON']
+_qemu_api_cfg = []
 # _qemu_api_cfg += ['--cfg', 'feature="allocator"']
 if rustc.version().version_compare('>=1.77.0')
   _qemu_api_cfg += ['--cfg', 'has_offset_of']
-- 
2.47.0


