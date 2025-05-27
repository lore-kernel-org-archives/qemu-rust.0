Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uJxit-0005dL-Vw
	for mharc-qemu-rust@gnu.org; Tue, 27 May 2025 13:04:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJxip-0005cO-Kh
 for qemu-rust@nongnu.org; Tue, 27 May 2025 13:04:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJxim-0006fx-Uh
 for qemu-rust@nongnu.org; Tue, 27 May 2025 13:04:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748365451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V4aZkVQe1X/Spfd9+OxNGkT/25sWGd8bXwBhMt/jceI=;
 b=ev4tr8T+KJfB/H6jOYVgQbJmfTFNYjOkA29phIGdFyOnTf8jYSDna4eLKbjIHidRdCJ31w
 dEhzuIY7+761RhrULUcyMPROKfdHoETzbWT08WCtuo7b5UBQTB/AqcaexiMaSjT02BL2SW
 /UWGYUeNy84qZY2PJT0IAXAodzfxM1A=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-G6qRg5J3N629sG_2scwsfg-1; Tue, 27 May 2025 13:04:09 -0400
X-MC-Unique: G6qRg5J3N629sG_2scwsfg-1
X-Mimecast-MFC-AGG-ID: G6qRg5J3N629sG_2scwsfg_1748365448
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-604bc3ae8fcso1750277a12.1
 for <qemu-rust@nongnu.org>; Tue, 27 May 2025 10:04:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748365447; x=1748970247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V4aZkVQe1X/Spfd9+OxNGkT/25sWGd8bXwBhMt/jceI=;
 b=UxrwD83K96E0HEmRr1B+goqAe3wrI4lVAzichZPffBd9f/5XZWsmLB+RoEdxp1qszd
 XAbXcv5//25JHYGJ9IMrTr16rGt+UzdNmk7ZB1UKETiNB0d7tg14lXGc1Y4Yc2Om687b
 NEvrvotHGFXBYCU5nxIoL3dff+3JtI6QCA3PoNI5HLE9Y/EwNlK7jTXN2J1oV5B8/owX
 pHVcGYM0EN4DBdr6YV6pLRbD1XmqDMciKxe0Qa0umQAPO7GCfrTMJHLmXdNCDxZccdd4
 zSul9dbBQMluHbdeOuNKM+9LEpGLT+0ZdhwfYmgLcUE6/uFD4HNm4aTX3k3+Y5rCjEOe
 IVxg==
X-Gm-Message-State: AOJu0YyO4tqGsD25rT5bgkEcykl4IA9G8bQnMWmn720n7CzyzIlxA5ij
 yGiQRIkhm4xypRq3fI6CzaOvJ6tDD61mSLXKfxk2+zlSgMT3J6gfeJ9Le4rcd1dWXoROii5RWPS
 /Xn7lsRnTu2DdiTOGQbUB5QR2PJcyHcN3TM4bk74J79zxEOlTDJHmVgQQQ266PSA=
X-Gm-Gg: ASbGncteYRo//VTV3I4GvNnQnnj4oP0EOUdfltWO7vABCzOtI30euZXaWebMzaAx9Ig
 okn34sz88QLU8IFgN0ANORoDKLbCKGiGdosuPlF9asQF7mVibQygKnAS8SyHZR5U40jPbdZcE/7
 bqLV/eZ7N0Wo3x2LkaKBn5/ukkgWzJ4+299hdyJj8ICD0xy+nuXYsb3+pHqIhzk21WK/+6VP+A9
 QiIlwq/tiWIWgXj9LKZ+QyGzWm0uU9ywOhbP2rinqZ1kS4wcpNU8Rg0dupMIniSUE1FAPCbCZt0
 NWqro3+sBgroYQ==
X-Received: by 2002:a05:6402:34c1:b0:5fb:ad3c:cee9 with SMTP id
 4fb4d7f45d1cf-602da8dde73mr11271219a12.28.1748365447492; 
 Tue, 27 May 2025 10:04:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4LoKixDs5J+EI0OHKMItBHRlzlXmw17NtWfbttHNL5Snhm9R4B2QVYPR7W+KOFFeLnT+0Ow==
X-Received: by 2002:a05:6402:34c1:b0:5fb:ad3c:cee9 with SMTP id
 4fb4d7f45d1cf-602da8dde73mr11271170a12.28.1748365447044; 
 Tue, 27 May 2025 10:04:07 -0700 (PDT)
Received: from [192.168.122.1] ([151.95.46.79])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6004d4f1be3sm18224012a12.5.2025.05.27.10.04.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 10:04:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 1/6] meson: update to version 1.8.1
Date: Tue, 27 May 2025 19:03:59 +0200
Message-ID: <20250527170404.1580482-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250527170404.1580482-1-pbonzini@redhat.com>
References: <20250527170404.1580482-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UyepBFKlzeecRwxWXG5V5XLQOmyHAGxZfCNYzkkPbh4_1748365448
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.907,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 27 May 2025 17:04:18 -0000

This adds several improvements to Rust support, including
native clippy and rustdoc targets, the "objects" keyword,
and running doctests.

Require it only when Rust support is requested, to avoid
putting a strict requirement on all build platforms for the
sake of an experimental feature.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                                  |   8 ++++++++
 python/scripts/vendor.py                   |   4 ++--
 python/wheels/meson-1.5.0-py3-none-any.whl | Bin 959846 -> 0 bytes
 python/wheels/meson-1.8.1-py3-none-any.whl | Bin 0 -> 1013001 bytes
 pythondeps.toml                            |   2 +-
 tests/lcitool/mappings.yml                 |   6 +++++-
 6 files changed, 16 insertions(+), 4 deletions(-)
 delete mode 100644 python/wheels/meson-1.5.0-py3-none-any.whl
 create mode 100644 python/wheels/meson-1.8.1-py3-none-any.whl

diff --git a/configure b/configure
index 2ce8d29fac2..74b3865e51e 100755
--- a/configure
+++ b/configure
@@ -1178,6 +1178,14 @@ fi
 ##########################################
 # detect rust triple
 
+meson_version=$($meson --version)
+if test "$rust" != disabled && ! version_ge "$meson_version" 1.8.1; then
+  if test "$rust" = enabled; then
+    error_exit "Rust support needs Meson 1.8.1 or newer"
+  fi
+  echo "Rust needs Meson 1.8.1, disabling" 2>&1
+  rust=disabled
+fi
 if test "$rust" != disabled && has "$rustc" && $rustc -vV > "${TMPDIR1}/${TMPB}.out"; then
   rust_host_triple=$(sed -n 's/^host: //p' "${TMPDIR1}/${TMPB}.out")
 else
diff --git a/python/scripts/vendor.py b/python/scripts/vendor.py
index 0405e910b48..b47db00743a 100755
--- a/python/scripts/vendor.py
+++ b/python/scripts/vendor.py
@@ -41,8 +41,8 @@ def main() -> int:
     parser.parse_args()
 
     packages = {
-        "meson==1.5.0":
-        "52b34f4903b882df52ad0d533146d4b992c018ea77399f825579737672ae7b20",
+        "meson==1.8.1":
+        "374bbf71247e629475fc10b0bd2ef66fc418c2d8f4890572f74de0f97d0d42da",
     }
 
     vendor_dir = Path(__file__, "..", "..", "wheels").resolve()
diff --git a/pythondeps.toml b/pythondeps.toml
index 7eaaa0fed10..7884ab521d1 100644
--- a/pythondeps.toml
+++ b/pythondeps.toml
@@ -19,7 +19,7 @@
 
 [meson]
 # The install key should match the version in python/wheels/
-meson = { accepted = ">=1.5.0", installed = "1.5.0", canary = "meson" }
+meson = { accepted = ">=1.5.0", installed = "1.8.1", canary = "meson" }
 pycotap = { accepted = ">=1.1.0", installed = "1.3.1" }
 
 [docs]
diff --git a/tests/lcitool/mappings.yml b/tests/lcitool/mappings.yml
index 673baf39367..8f0e95e1c56 100644
--- a/tests/lcitool/mappings.yml
+++ b/tests/lcitool/mappings.yml
@@ -8,6 +8,10 @@ mappings:
 
   meson:
     OpenSUSELeap15:
+    # Use Meson from PyPI wherever Rust is enabled
+    Debian:
+    Fedora:
+    Ubuntu:
 
   python3:
     OpenSUSELeap15: python311-base
@@ -72,7 +76,7 @@ mappings:
 pypi_mappings:
   # Request more recent version
   meson:
-    default: meson==1.5.0
+    default: meson==1.8.1
 
   # Drop packages that need devel headers
   python3-numpy:
-- 
2.49.0


