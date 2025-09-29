Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE00CAC5B9
	for <qemu-rust@archiver.kernel.org>; Mon, 29 Sep 2025 15:51:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v3G94-00010D-MA; Mon, 29 Sep 2025 11:50:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3G8i-0000nI-0G
 for qemu-rust@nongnu.org; Mon, 29 Sep 2025 11:50:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3G8R-0000Kw-VX
 for qemu-rust@nongnu.org; Mon, 29 Sep 2025 11:50:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759160994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QCOPbYu7ryKrm76CAIdUgFO9Ove0c1exWjeI/Cavblo=;
 b=X2CButmKlSkjR40kZ5A+rFnVaB4AxBGCodW+xRApyf62MUaNalYE5Uwf0fmFoh3q4Ql8CF
 5lWWaMyExEcOiHX4aEE06e+pD46MgXoDKUd/wVEi5p+Y4JYl/R1iHDSkq+JPXl1NFVVT3g
 cKx6tyMflhnK/jfEXO8BoGz/T9Q1wuw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-jfou6mvGNNm8IBmlaOGWrg-1; Mon, 29 Sep 2025 11:49:52 -0400
X-MC-Unique: jfou6mvGNNm8IBmlaOGWrg-1
X-Mimecast-MFC-AGG-ID: jfou6mvGNNm8IBmlaOGWrg_1759160991
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-634779072f7so4345497a12.3
 for <qemu-rust@nongnu.org>; Mon, 29 Sep 2025 08:49:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759160991; x=1759765791;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QCOPbYu7ryKrm76CAIdUgFO9Ove0c1exWjeI/Cavblo=;
 b=vzprC/9aN2U+Hos+5bB+coH28TOhcyreRv5/+74RgAQs2zbv68q9TqEocS49N9wMw0
 LACOgi/u9wDZtFr0le932cgG3AiIpVb5EvuKr8aOC06GSoBc+Xy+uq4st2ZP633IEyK6
 4o7SHM9Ao7afkAQzYIauSkLTXWQe32hYSDgmAMn2w/afEq7ZizM34Iq4+Yz9ZFiKoaZD
 AR1YsojSv334yt6O/UyGFpsbBewH9Pxvf2Ot3h1yPgvH7NzpbSFECYGq0osHsdhRKV7g
 L5pFZNjpMM+ENgpjQTc2j5DW3CPRXXPOHKapyEa/d2fODd5hyjfKXiHrvsZoR6fxuEqM
 CM8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbzmf0+lQz3GBSAHqyDHQ6BJaLgOGzx1VFKm5iIWVSTfQDc7hD/2LPF66N0nZ9sK0rRKOozwuO2qc=@nongnu.org
X-Gm-Message-State: AOJu0YyHVwCzJq1sR2n2JLRsZLzGYnh9Ni4pzQUf2Pq7CeKyoHsmFJZ/
 D7DByMUaMOVEbG4Q5A5+wv67f91U7eB8gfPuPEBXI5eCVQOTPTJSg1gmlHAN1RCjxZtK8E6uzTv
 SeqypBmnUF5SQz0WpXb01Ccns+A/BNyi8IQbgQUh061PC9oesmC0+KRE=
X-Gm-Gg: ASbGncuGTVRvTACULf8sM2QwKby9gkF9684nkYXWOiif9nEUEhmgaIKicM3nNInkiTr
 UxjAGaFwrT7R5UjYUyh4jzdiW5EDNrTUJVB8tA+9BRzxedVofyORVRUGD8A2cW1+6mM8cbaDWUQ
 SnuRj7xH8dSZwlujAwfQXyLNV89ihVC51rsNwB1nTQXBes1qM6WnRGgya9Wn0TmhTcSAB4Lo0v0
 gAr9QY+hpb0Q3hzqqWTkLIYjmuk6kGV3e10qjKnElR8ZBXetlqMKkGIh6MP4TEFeIcSBlP5Rauj
 iV53Ofb5p5F4gj4gcDOqeWREZkgF0X9EiUvBYVtePxRAc5+DArxiLZoxp3hq4wD1Wd2KNpWmWCW
 KVA/VWtMry7uqTGMJonTKojzPlUxEeKpT5Iq9nJ1mdFjyfw==
X-Received: by 2002:a05:6402:291:b0:634:544b:a756 with SMTP id
 4fb4d7f45d1cf-6349fa9464fmr12376232a12.32.1759160991304; 
 Mon, 29 Sep 2025 08:49:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG89lNt93/2CJxTZEWvqqvBpk4mU0wvXqR/CQaewsWXrhs+63GrZJGh6xBTe/G+o5aUNjIwmw==
X-Received: by 2002:a05:6402:291:b0:634:544b:a756 with SMTP id
 4fb4d7f45d1cf-6349fa9464fmr12376196a12.32.1759160990823; 
 Mon, 29 Sep 2025 08:49:50 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.127.188])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-634c4b96ff6sm5541900a12.46.2025.09.29.08.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 08:49:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Tanish Desai <tanishdesai37@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Mads Ynddal <mads@ynddal.dk>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, qemu-rust@nongnu.org
Subject: [PATCH 04/16] tracetool: add SPDX headers
Date: Mon, 29 Sep 2025 17:49:26 +0200
Message-ID: <20250929154938.594389-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929154938.594389-1-pbonzini@redhat.com>
References: <20250929154938.594389-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5kfND7hURI0JWL3NYvY1VInwBlGuqQBE-GLHhNuZta8_1759160991
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.513,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/tracetool/__init__.py                | 2 ++
 scripts/tracetool/backend/__init__.py        | 2 ++
 scripts/tracetool/backend/dtrace.py          | 2 ++
 scripts/tracetool/backend/ftrace.py          | 2 ++
 scripts/tracetool/backend/log.py             | 2 ++
 scripts/tracetool/backend/simple.py          | 2 ++
 scripts/tracetool/backend/syslog.py          | 2 ++
 scripts/tracetool/backend/ust.py             | 2 ++
 scripts/tracetool/format/__init__.py         | 2 ++
 scripts/tracetool/format/c.py                | 2 ++
 scripts/tracetool/format/d.py                | 2 ++
 scripts/tracetool/format/h.py                | 2 ++
 scripts/tracetool/format/log_stap.py         | 2 ++
 scripts/tracetool/format/simpletrace_stap.py | 2 ++
 scripts/tracetool/format/stap.py             | 2 ++
 scripts/tracetool/format/ust_events_c.py     | 2 ++
 scripts/tracetool/format/ust_events_h.py     | 2 ++
 17 files changed, 34 insertions(+)

diff --git a/scripts/tracetool/__init__.py b/scripts/tracetool/__init__.py
index 9dd8ec27e15..c4fa0f74e6f 100644
--- a/scripts/tracetool/__init__.py
+++ b/scripts/tracetool/__init__.py
@@ -1,3 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
 """
 Machinery for generating tracing-related intermediate files.
 """
diff --git a/scripts/tracetool/backend/__init__.py b/scripts/tracetool/backend/__init__.py
index 70401309196..bf91e443e99 100644
--- a/scripts/tracetool/backend/__init__.py
+++ b/scripts/tracetool/backend/__init__.py
@@ -1,3 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
 """
 Backend management.
 
diff --git a/scripts/tracetool/backend/dtrace.py b/scripts/tracetool/backend/dtrace.py
index 4835454193d..b4af403025c 100644
--- a/scripts/tracetool/backend/dtrace.py
+++ b/scripts/tracetool/backend/dtrace.py
@@ -1,3 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
 """
 DTrace/SystemTAP backend.
 """
diff --git a/scripts/tracetool/backend/ftrace.py b/scripts/tracetool/backend/ftrace.py
index e6317ca4bfb..a14aafcee62 100644
--- a/scripts/tracetool/backend/ftrace.py
+++ b/scripts/tracetool/backend/ftrace.py
@@ -1,3 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
 """
 Ftrace built-in backend.
 """
diff --git a/scripts/tracetool/backend/log.py b/scripts/tracetool/backend/log.py
index 9842522b184..faacec46105 100644
--- a/scripts/tracetool/backend/log.py
+++ b/scripts/tracetool/backend/log.py
@@ -1,3 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
 """
 Stderr built-in backend.
 """
diff --git a/scripts/tracetool/backend/simple.py b/scripts/tracetool/backend/simple.py
index 066e5e9f11f..97e40495ee9 100644
--- a/scripts/tracetool/backend/simple.py
+++ b/scripts/tracetool/backend/simple.py
@@ -1,3 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
 """
 Simple built-in backend.
 """
diff --git a/scripts/tracetool/backend/syslog.py b/scripts/tracetool/backend/syslog.py
index 74af0380899..78ee67136b8 100644
--- a/scripts/tracetool/backend/syslog.py
+++ b/scripts/tracetool/backend/syslog.py
@@ -1,3 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
 """
 Syslog built-in backend.
 """
diff --git a/scripts/tracetool/backend/ust.py b/scripts/tracetool/backend/ust.py
index 6cc651646dd..3aa9bb1da29 100644
--- a/scripts/tracetool/backend/ust.py
+++ b/scripts/tracetool/backend/ust.py
@@ -1,3 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
 """
 LTTng User Space Tracing backend.
 """
diff --git a/scripts/tracetool/format/__init__.py b/scripts/tracetool/format/__init__.py
index 94a37bfce9f..7b9d1b57826 100644
--- a/scripts/tracetool/format/__init__.py
+++ b/scripts/tracetool/format/__init__.py
@@ -1,3 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
 """
 Format management.
 
diff --git a/scripts/tracetool/format/c.py b/scripts/tracetool/format/c.py
index 3c4398c2373..50e03313cbf 100644
--- a/scripts/tracetool/format/c.py
+++ b/scripts/tracetool/format/c.py
@@ -1,3 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
 """
 trace/generated-tracers.c
 """
diff --git a/scripts/tracetool/format/d.py b/scripts/tracetool/format/d.py
index 684598c1835..e9e33dfe30a 100644
--- a/scripts/tracetool/format/d.py
+++ b/scripts/tracetool/format/d.py
@@ -1,3 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
 """
 trace/generated-tracers.dtrace (DTrace only).
 """
diff --git a/scripts/tracetool/format/h.py b/scripts/tracetool/format/h.py
index 2119753be10..be7f32e67b9 100644
--- a/scripts/tracetool/format/h.py
+++ b/scripts/tracetool/format/h.py
@@ -1,3 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
 """
 trace/generated-tracers.h
 """
diff --git a/scripts/tracetool/format/log_stap.py b/scripts/tracetool/format/log_stap.py
index 02f23bfb8d2..259303a189d 100644
--- a/scripts/tracetool/format/log_stap.py
+++ b/scripts/tracetool/format/log_stap.py
@@ -1,3 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
 """
 Generate .stp file that printfs log messages (DTrace with SystemTAP only).
 """
diff --git a/scripts/tracetool/format/simpletrace_stap.py b/scripts/tracetool/format/simpletrace_stap.py
index 3c3584a9318..c7bde97a855 100644
--- a/scripts/tracetool/format/simpletrace_stap.py
+++ b/scripts/tracetool/format/simpletrace_stap.py
@@ -1,3 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
 """
 Generate .stp file that outputs simpletrace binary traces (DTrace with SystemTAP only).
 """
diff --git a/scripts/tracetool/format/stap.py b/scripts/tracetool/format/stap.py
index 04c7a35a25f..285c9203ba7 100644
--- a/scripts/tracetool/format/stap.py
+++ b/scripts/tracetool/format/stap.py
@@ -1,3 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
 """
 Generate .stp file (DTrace with SystemTAP only).
 """
diff --git a/scripts/tracetool/format/ust_events_c.py b/scripts/tracetool/format/ust_events_c.py
index ea5f0ae99fa..074226bfd37 100644
--- a/scripts/tracetool/format/ust_events_c.py
+++ b/scripts/tracetool/format/ust_events_c.py
@@ -1,3 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
 """
 trace/generated-ust.c
 """
diff --git a/scripts/tracetool/format/ust_events_h.py b/scripts/tracetool/format/ust_events_h.py
index 242c9814fdc..cee7970a403 100644
--- a/scripts/tracetool/format/ust_events_h.py
+++ b/scripts/tracetool/format/ust_events_h.py
@@ -1,3 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
 """
 trace/generated-ust-provider.h
 """
-- 
2.51.0


