Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55FFD19515
	for <qemu-rust@archiver.kernel.org>; Tue, 27 Jan 2026 09:37:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vkfVn-0007GL-W6; Tue, 27 Jan 2026 04:37:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vkfVk-0007BL-5X
 for qemu-rust@nongnu.org; Tue, 27 Jan 2026 04:37:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vkfVi-0008MK-FZ
 for qemu-rust@nongnu.org; Tue, 27 Jan 2026 04:37:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769506640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=DbYPUPxr2q/2IvChwuhtTj6rweOpUXNky+tjgBmrHMjxPLaZAoWYluscXBk6ZV4OzO9iYn
 L7iQo0apVstRoNjae3F20qgS9kLEeSz5dO/Odyl1QXR16ivykNHISBhN7SxEqHWQgI/Xwr
 asUARZRrADudqBsEmEqO0yJfXNVjb0M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-396-8jYrIdRFNCmbc3Gjz-M2Wg-1; Tue, 27 Jan 2026 04:37:19 -0500
X-MC-Unique: 8jYrIdRFNCmbc3Gjz-M2Wg-1
X-Mimecast-MFC-AGG-ID: 8jYrIdRFNCmbc3Gjz-M2Wg_1769506638
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4801e9e7159so44038605e9.1
 for <qemu-rust@nongnu.org>; Tue, 27 Jan 2026 01:37:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769506638; x=1770111438;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=t8NRAMSKmbYUHbEelGGgvLbksMeHMKnVs/P+EuutL2wHSVjG4uIm1RbnhF8aGc2kLn
 0g55m59sSkjt+nvrOqn6JdgEreDVWnu/4rxjIq0/8J1DaC1lGbW5bVp1EUSMwNbz1cAP
 4RdEetY2RRurFOKBGqNpP9QqcMt8ZzdJp1fTOYAN6OAwPef6TTxGSSZbXi3z4/DiexBG
 tCvxDxYcH5t/knjAbNlojjWnwxj0f+nsfGge1DjHTx3kCesTkBlRhsOyCZfO2ISSHDct
 GT+GpEjtzf+i3+e4yokHhqXR/0N399gdejKHJ7UgOQJfPPdTTOEf0lJB10VDd8Kz1MgZ
 ulZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWB+Jx84muu0rXygSHodZi5M4TbYZlpOdkfdWk2fzDnky913CaRx1S8NMxPI9+i312Ged7tphwMzo=@nongnu.org
X-Gm-Message-State: AOJu0YyoRmaATkkqZeb0YJZKZVwCfPktaoBa7v7BuFZ6iT5ID+JuMfm7
 g7DShoFDNRx3MOXXppron0wPb/Cl2yj7ZKrKIKcxXrldn/tL7zvfSN9HFrpAO47T524aSFgntV0
 R/PwXR/lmDjHhquK4k7JNmqD2Ks5KuZvLSwdur6oICFsEMNP6spcSryU=
X-Gm-Gg: AZuq6aJISrWi7UG4COrGYZJWWFYmWch+I4X98vb+DTC4tB0XmAOmmF6ITnvW2uhTEzn
 yDo1JRsNd1IbJR0+xx9o620bMt6arg1oNzuJXrKSlDiUseCM1nA1u+noOHy/V8sR8Lw1dDv0yTd
 /f4mTiJ1++6ikV82/2JZObFYNsZv2zCYMM4IPhtHS2LexVMxj4tW5d+noPPMPexa2rDd9jtlJ1v
 c6JHXex4PSw7JJAKwVm7Wzo9kTYAzCkFXh5qKY37b5JtXzAhiEJqbxjMLroNpzi2stvqtVjxVRw
 Ju7RRDrLSfh73QeivLlLvPWuHMJfrcC3BejxXh4zJx2QEyFxKgub3effWFYxc6EkvljMO7aFiYP
 J0rytJ+eO2pRoaYow2QW0HocndVIrFqt+r2uWC1JjUUK4QRZ9ecInDBEJkWMfSIXCmBTjto9ZF7
 0FUl18LxEeu6gxwg==
X-Received: by 2002:a05:600c:8b6b:b0:47e:e946:3a59 with SMTP id
 5b1f17b1804b1-48069c92effmr13184145e9.34.1769506637893; 
 Tue, 27 Jan 2026 01:37:17 -0800 (PST)
X-Received: by 2002:a05:600c:8b6b:b0:47e:e946:3a59 with SMTP id
 5b1f17b1804b1-48069c92effmr13183805e9.34.1769506637498; 
 Tue, 27 Jan 2026 01:37:17 -0800 (PST)
Received: from [192.168.10.48] ([151.61.26.160])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c40e04sm49024895e9.13.2026.01.27.01.37.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 01:37:16 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Mohd Kashif Khan <kashif04x@gmail.com>
Cc: qemu-devel@nongnu.org,
	qemu-rust@nongnu.org
Subject: Re: [PATCH] rust/hpet: remove stale TODO comment
Date: Tue, 27 Jan 2026 10:37:15 +0100
Message-ID: <20260127093715.353125-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260126210910.28889-1-kashif04x@gmail.com>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Q5WeSo69YDnj33KT3T2paDVPCQa-0JAgKwNO1qu131U_1769506638
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


