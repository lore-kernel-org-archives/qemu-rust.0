Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uBrlt-0004F3-Il
	for mharc-qemu-rust@gnu.org; Mon, 05 May 2025 05:06:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uBrkq-0003W1-T6
 for qemu-rust@nongnu.org; Mon, 05 May 2025 05:04:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uBrkm-0005jF-LQ
 for qemu-rust@nongnu.org; Mon, 05 May 2025 05:04:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746435887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kN1TGoVTaoRIcNAwQlBZk66AaqMf/VcTftHIBmCIyig=;
 b=WlpCnjEp8kWfpHwKvzc3YWL14eeV8Ggcyt8zu4hYXMeYH3p4N+/UlRAc0tQsJ3egM052Sc
 +Ok2vu/vS5Thbpzqpx0QJXpDSQ3yHWVQPk7pYjN95lbsNBHEVE+sMiv4Dv0oNeRrXcTXN6
 +z4Y7c1gc1cgMoC+ohhWLbr839blGT4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-aHUGk8zWMMKuOs128oZ6tg-1; Mon, 05 May 2025 05:04:46 -0400
X-MC-Unique: aHUGk8zWMMKuOs128oZ6tg-1
X-Mimecast-MFC-AGG-ID: aHUGk8zWMMKuOs128oZ6tg_1746435885
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-39d917b1455so1005087f8f.3
 for <qemu-rust@nongnu.org>; Mon, 05 May 2025 02:04:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746435885; x=1747040685;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kN1TGoVTaoRIcNAwQlBZk66AaqMf/VcTftHIBmCIyig=;
 b=avUZrcP9xw+Ha7ylsElItnYcsWSQkHmWWD5/Jbd2qy35/jIeIhUimPo+7Gi0wuJuBW
 B58ZjiKngBqmQFRvg4Udu0ag96BpNXHwC0QORhoJWMJFoNBOZ05g7WuPNf9PQB0jo3Ab
 Mo54MvdBbd0P/6ITDj4KULPT02ThRW2Q0vYIeNKpONeSn3Mbaz286/4nlhJlJ3btND9Y
 ON2GsVz+kKhaNgIGuG7zCHaEQrAMdpWf0sOmi1boF7iK0ZdMTZJe12jmnjnPy/WEbW6W
 Mw68Gv24CjPhIRrkxNaKDtEE92Xns0/mcLG8oMqOTmRptJrprQPTLTGcYw/a+4JixCiQ
 98Qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPqDD6cDtZzPntpkxjS3OeP8nWQpr0zwr8uUsHESL6694MjxeFRtG3kjkikBfMgyUwMidMY0nkK2M=@nongnu.org
X-Gm-Message-State: AOJu0YxQLLHF6QLy6oLtPusXp3Tg+aHr1oyvKTrTRp+Sx9nzOtsyMIlr
 t2U1gwSh4aTb0F891+ZMbN1g5XcqrsmbkMVqphMIDfiHyPQHh74pguI+naypnaduDscGR1rj52n
 LyKP36l9yhQPJ/dSOWAvtJJke8RZ6K+i22U7wy8x5QbER/eLFolJkremJZM0=
X-Gm-Gg: ASbGncsDUGJXx/Jil6gTTkykMlm6ui/ImduPmIuqpaGDkBCC0vHmvTizh7Ym9MdJNTv
 7GlPpKE1ContJPMhRyQ0CbW64RGNAvVkSXv0eauINHjQ/RxYJqEDB1o+SZu1hoKJxBXY10odjWh
 /AE4SRO2BDzrQmm1xl0EVdZ/X4inVJlvqfDGnB3gZSaBoid995hZBwsYL/yBc390q3VWUDcCe+A
 WtTklPZo734f9pqD4pVV4EKk0wm1rwHexqbqbZaI6MT1S2/5wOYr5eDgVqn8Sz0VUR2azMR1HlD
 aXFu5WuKRIarqwQ=
X-Received: by 2002:a05:600c:8288:b0:43c:f689:dd with SMTP id
 5b1f17b1804b1-441c48dbf43mr51099085e9.19.1746435884665; 
 Mon, 05 May 2025 02:04:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHl38gFWyU13dgPDDOfB4VMq78dJaWZuKUcTbTyCJHJ8bVfnfjoJE3CXXKsmQwiye5TRTKrBw==
X-Received: by 2002:a05:600c:8288:b0:43c:f689:dd with SMTP id
 5b1f17b1804b1-441c48dbf43mr51098815e9.19.1746435884217; 
 Mon, 05 May 2025 02:04:44 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.54.106])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b8992b4csm129623495e9.0.2025.05.05.02.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 02:04:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: manos.pitsidianakis@linaro.org,
	qemu-rust@nongnu.org
Subject: [PATCH 02/11] meson, cargo: require Rust 1.77.0
Date: Mon,  5 May 2025 11:04:27 +0200
Message-ID: <20250505090438.24992-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250505090438.24992-1-pbonzini@redhat.com>
References: <20250505090438.24992-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4nGl1YaAs3bTlI1lWqkabufCxQ68iZz_CVaP7snr1Zk_1746435885
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.411,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
X-List-Received-Date: Mon, 05 May 2025 09:04:56 -0000
X-List-Received-Date: Mon, 05 May 2025 09:04:56 -0000
X-List-Received-Date: Mon, 05 May 2025 09:04:56 -0000

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build      | 6 +++---
 rust/Cargo.toml  | 2 +-
 rust/clippy.toml | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meson.build b/meson.build
index 8ae70dbe45a..e77da3f9b75 100644
--- a/meson.build
+++ b/meson.build
@@ -94,12 +94,12 @@ have_rust = have_rust and add_languages('rust', native: true,
     required: get_option('rust').disable_auto_if(not have_system))
 if have_rust
   rustc = meson.get_compiler('rust')
-  if rustc.version().version_compare('<1.63.0')
+  if rustc.version().version_compare('<1.77.0')
     if get_option('rust').enabled()
-      error('rustc version ' + rustc.version() + ' is unsupported. Please upgrade to at least 1.63.0')
+      error('rustc version ' + rustc.version() + ' is unsupported. Please upgrade to at least 1.77.0')
     else
       warning('rustc version ' + rustc.version() + ' is unsupported, disabling Rust compilation.')
-      message('Please upgrade to at least 1.63.0 to use Rust.')
+      message('Please upgrade to at least 1.77.0 to use Rust.')
       have_rust = false
     endif
   endif
diff --git a/rust/Cargo.toml b/rust/Cargo.toml
index 5ace47c69be..eda7980b31a 100644
--- a/rust/Cargo.toml
+++ b/rust/Cargo.toml
@@ -12,7 +12,7 @@ edition = "2021"
 homepage = "https://www.qemu.org"
 license = "GPL-2.0-or-later"
 repository = "https://gitlab.com/qemu-project/qemu/"
-rust-version = "1.63.0"
+rust-version = "1.77.0"
 
 [workspace.lints.rust]
 unexpected_cfgs = { level = "deny", check-cfg = [
diff --git a/rust/clippy.toml b/rust/clippy.toml
index 5d190f91dec..933e46a2ffb 100644
--- a/rust/clippy.toml
+++ b/rust/clippy.toml
@@ -1,2 +1,2 @@
 doc-valid-idents = ["PrimeCell", ".."]
-msrv = "1.63.0"
+msrv = "1.77.0"
-- 
2.49.0


