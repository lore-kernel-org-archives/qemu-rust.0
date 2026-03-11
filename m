Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5162D112584E
	for <qemu-rust@archiver.kernel.org>; Wed, 11 Mar 2026 16:17:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1w0MFH-0007Fs-1q; Wed, 11 Mar 2026 12:17:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1w0MEy-0007DL-GQ
 for qemu-rust@nongnu.org; Wed, 11 Mar 2026 12:16:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1w0MEx-0000jf-66
 for qemu-rust@nongnu.org; Wed, 11 Mar 2026 12:16:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773245814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=PEyo9LxZ7W74i6bsoVoHRUP0gFDBe9Uilqn582MVFw4w7AozqRejWFBbY05EcTU9bfl7VM
 WhC257HO46Rb6zhSCoGFe7R8l1KXl7DR8DsDB5wHrLYV4KK7VJWeQCpz31AxO9+gswE55n
 Nw6AQb49ZB31t9SvExgk24aDwSb65+Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-0GUz-cmAOLSygnt8BM3oxw-1; Wed, 11 Mar 2026 12:16:52 -0400
X-MC-Unique: 0GUz-cmAOLSygnt8BM3oxw-1
X-Mimecast-MFC-AGG-ID: 0GUz-cmAOLSygnt8BM3oxw_1773245812
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4853ab1cae0so84255e9.2
 for <qemu-rust@nongnu.org>; Wed, 11 Mar 2026 09:16:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773245811; x=1773850611;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=tr6OVbggUKSxcuJdF8Q/s731JwSbljg9LqZWxd8F4oQV9D8T8f4OdES8l67mHUO11N
 0Z8lzwQujJ+wMDXRdX3WzycNI8WLE+nYSKj/h45EzgGkM4cWu0cK03PsNWvTv2zPFhb3
 NmctmeWY2UxWKiEKR79n3JCSNlxfzBSVqhnPu6QgNAfx+IpfQvTewdhKmBOmc/yUxVyv
 myxH3/lQYQZDtWMyj3Q4mifZzNuWWCrN9I4Sw7ge9N2P35+NF+mssJxh0acOkMrR5tN3
 gqGSpXok1TJGfr9Dbc9XuQb+0UXFDPuGIFwlH4a3WT9yfGEVIbLP1ZAmsvJtw+h+f/B0
 DZ7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXC96ZWqp37mda3GJ0pRU3carILJskyBwagIzqn/iQDDVMx87hQtanXubIUidGn1ry2AHIYZh4JZo8=@nongnu.org
X-Gm-Message-State: AOJu0YxZ7FBAMSxP/iSXETYDzB2tfPFgqE7GdelSdqR+YRVdnJ74BeA8
 rDF13jXXzM+srx8CwXHzYQmyMbTZSeLsMtAOJdHnoLXKgbMkhqbFT94LreeTBkpEHcl1hTLWOPn
 rDcq+Px1V9RkoqkfTOtknhFH1ciEkNoIvCKY8kqJE1byQ5PgcsUQ2qWd08HRE5es=
X-Gm-Gg: ATEYQzxNTJKIk6h2whc53H+PkOc5TtblLQQNibT7pjXSDTJfdGAqeyxTvSZGpxRQtYe
 kLvMSBlUQw4v8Y77cWlcqMYvW0H47yRnqduHDcu2Bo02NPqxjQoky2ZvG3Hb1kZhQP3cH6FOzi0
 MLeUXC2qLfPAsmQ9JV+tmFjDzN41AQCgzQaAPns6oxnDsSpT42xeiH426diazYucUn8W8lK4NuK
 Wo1RSimksv7QLOPqL3r2i5PIFjulaW6rXcoTuzmiJNBiJ/kYSsIJZQ5d1eEcvo7p1fJtMxpOtGF
 O8n4ofYG8f1j4FoFnoiT9TQMRZ5onMKteCKaQt344JFSRKXww9HnkkNo2P2noVKaAys1t9zAsLH
 l6zZXKyOXZV42wac4NY+ihNki7cmj3uSMzT/NiyNC6owgLRj97ZkFGpxvzgVexxXToAPpGlQv3q
 AMPAKBM3bEO1zp6E2FyVUZCd2NrCk=
X-Received: by 2002:a05:600c:5493:b0:485:365f:b4e7 with SMTP id
 5b1f17b1804b1-4854b0ca47cmr57984745e9.14.1773245811125; 
 Wed, 11 Mar 2026 09:16:51 -0700 (PDT)
X-Received: by 2002:a05:600c:5493:b0:485:365f:b4e7 with SMTP id
 5b1f17b1804b1-4854b0ca47cmr57984285e9.14.1773245810733; 
 Wed, 11 Mar 2026 09:16:50 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.144.138])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48541b7f255sm166716515e9.12.2026.03.11.09.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2026 09:16:50 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: Re: [PATCH] rust: Update Cargo.lock
Date: Wed, 11 Mar 2026 17:16:49 +0100
Message-ID: <20260311161649.561659-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309172440.66409-1-philmd@linaro.org>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Y9_lyoiaohWIAgCT69BM15lt1F6IKwxCQlqEFT6_drI_1773245812
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.819, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.903,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Queued, thanks.

Paolo


