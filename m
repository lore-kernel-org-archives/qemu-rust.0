Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D29FCAC5B5
	for <qemu-rust@archiver.kernel.org>; Mon, 29 Sep 2025 15:54:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v3G9P-0001AU-KB; Mon, 29 Sep 2025 11:50:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3G8d-0000mE-VB
 for qemu-rust@nongnu.org; Mon, 29 Sep 2025 11:50:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3G8P-0000K8-4y
 for qemu-rust@nongnu.org; Mon, 29 Sep 2025 11:50:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759160989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YG+Kj4OjUTaTT7jTstOf3QwSS6l76vhdq2cWEryDBwk=;
 b=Kk5CBLV/NAAKe2I7cHP+BoUnBXOhBY6ZjSYM/YJqTtJxiEwcgpZ6wcApcyCSNcNUDCAS4n
 L2qTqbtP0LIzpNk0Zxf37JJfDWlu6tS9SmnN2+jkQ/J3NbmCGofKQRSQ9L8kFcM43U/RWa
 18nZ0Pblnv14bumshKioxGOUt47duTo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-398-mAa_LgF9N823wXxMbMh9Rw-1; Mon, 29 Sep 2025 11:49:44 -0400
X-MC-Unique: mAa_LgF9N823wXxMbMh9Rw-1
X-Mimecast-MFC-AGG-ID: mAa_LgF9N823wXxMbMh9Rw_1759160983
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-b3f2cfc26edso106278266b.2
 for <qemu-rust@nongnu.org>; Mon, 29 Sep 2025 08:49:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759160983; x=1759765783;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YG+Kj4OjUTaTT7jTstOf3QwSS6l76vhdq2cWEryDBwk=;
 b=oqc2uA5oeO6oGpCjDCUvOaDpntjBlXlsrySCbeN+ctNUQ5VruwsCRJaLCl/fh9EfnU
 iH+BcF7QJsLG9jpxNO7jCV05iM/Nis3j3h6S36SnxiLk3uz/BjJPxcXq+1gL8Eg5A08O
 rNle0aBChyzrp7eCcKsJ6j6rj1T9j7LkGJU9uZMkT+paOAA89d7mXHJzt446bNghCfSv
 ceq7dW99TFzZvnb0+6d5nA9xt1DHFQgIXdsGB2kgAXob+elEWBx/dnbrYIUfN/0Uz9jL
 3m24jCCWBAp5Occq3Lx2JlwzlsummaJiVLMtyH1/9X6jnhXj/JjFS0dVn+X5AfhdcqrU
 g6fA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsmFzsA96JNQIYWan3AAx2R2D2IWzoknKfhKpa0dETr8H5hcDyGIoE/M2lRrLJW8Yw2gGchmkeMeg=@nongnu.org
X-Gm-Message-State: AOJu0YwHZg/gsmrLYuSPYqIYSUpXfsZUNiR9yKUryN6mHBqwqT9EXF1r
 ZaoPQTpE+xi5dAk0IO2LqeNy6zyduAP3jYipVWAhuFG6CCkfJRRkAFbfgzCYdjTd8krsXBl0ws6
 GQURDckq15rERdnqhnbygD49adoyv+lIkK5cn+5blJOE6Q4WxdHMHGAU=
X-Gm-Gg: ASbGncskW98uPLN9bp/S8R2Z5jCHeoCVgMAd2fGsXthH8T0LijdM8gohxdE4mB/xPpS
 GrxhFCzajeA8wxJd80mx7shkkligKCd2ik8I4kfdI7CDYon/R5aNCEVYVN2MxoxedJFJoKwPhug
 laCbKwIUwAXT8qbnGvqI46niS4A+XX9qIlTFs7eajIhk9lMIc0/N1h99ozUVGcW6E2RdVeSh5IP
 VJspoOSaGFTl8vpUiEhqQUdJO5zsrxX9vG/nK5gmtCHLfIMGvAh8VmrBjxi8cw77snrEBQ6BeMp
 XAjk0vl1StK4TDjkxfUgKR1UQM1AxGkc3kL4ptXoxN7qeWj1N9IW0EyfCFTYKVTOve6LfhUQ9kv
 X0QtpAMpRrbogdBAYXpGatmWap3nfRyV8VfRvrjc2/6luoQ==
X-Received: by 2002:a17:907:1c95:b0:b2b:2967:5550 with SMTP id
 a640c23a62f3a-b34b684a607mr1735538366b.5.1759160983407; 
 Mon, 29 Sep 2025 08:49:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkRZw+cjfBjzE0zBl+cVMYhsnOi4WHvU6zVQt1fLSJa6I869c6OpqPg8aJnTuvr3X9qp11FA==
X-Received: by 2002:a17:907:1c95:b0:b2b:2967:5550 with SMTP id
 a640c23a62f3a-b34b684a607mr1735535366b.5.1759160982983; 
 Mon, 29 Sep 2025 08:49:42 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.127.188])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b3d27759835sm326470166b.13.2025.09.29.08.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 08:49:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Tanish Desai <tanishdesai37@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Mads Ynddal <mads@ynddal.dk>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, qemu-rust@nongnu.org
Subject: [PATCH 01/16] tracetool: fix usage of try_import()
Date: Mon, 29 Sep 2025 17:49:23 +0200
Message-ID: <20250929154938.594389-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929154938.594389-1-pbonzini@redhat.com>
References: <20250929154938.594389-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: O-IjD6AUMgyFaqw0c3RkvxQcQZtSw7tI58ymJJsOoGU_1759160983
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

try_import returns a tuple of a boolean and the requested module or attribute.
exists() functions return tracetool.try_import("tracetool.format." + name)[1]
but they should return the boolean value instead.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/tracetool/backend/__init__.py | 2 +-
 scripts/tracetool/format/__init__.py  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/tracetool/backend/__init__.py b/scripts/tracetool/backend/__init__.py
index 7bfcc86cc53..6c6344deddb 100644
--- a/scripts/tracetool/backend/__init__.py
+++ b/scripts/tracetool/backend/__init__.py
@@ -94,7 +94,7 @@ def exists(name):
     if name == "nop":
         return True
     name = name.replace("-", "_")
-    return tracetool.try_import("tracetool.backend." + name)[1]
+    return tracetool.try_import("tracetool.backend." + name)[0]
 
 
 class Wrapper:
diff --git a/scripts/tracetool/format/__init__.py b/scripts/tracetool/format/__init__.py
index 2dc46f3dd93..042fe7d103c 100644
--- a/scripts/tracetool/format/__init__.py
+++ b/scripts/tracetool/format/__init__.py
@@ -70,7 +70,7 @@ def exists(name):
     if len(name) == 0:
         return False
     name = name.replace("-", "_")
-    return tracetool.try_import("tracetool.format." + name)[1]
+    return tracetool.try_import("tracetool.format." + name)[0]
 
 
 def generate(events, format, backend, group):
-- 
2.51.0


