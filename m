Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uLzv5-00024Y-1C
	for mharc-qemu-rust@gnu.org; Mon, 02 Jun 2025 03:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1uLzv3-000247-4M
 for qemu-rust@nongnu.org; Mon, 02 Jun 2025 03:49:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1uLzv1-00065t-3u
 for qemu-rust@nongnu.org; Mon, 02 Jun 2025 03:49:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748850551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SdvafSm++tm4kgSygVghPh6eH2deZm0iLB71BAvCjCk=;
 b=fTEN0mQMolMjfWNWmnpn4H/56lO+S1BZk0uz/lTmvlfP+QmbUS2rDG+1fKs1DpQjHOMMk6
 +K24CQTTlA97oSipb+2Za/JmevHe1D45Fm8vE3B+TJRYQOh+qrWD3+AlE1n/fH1C/nONGL
 OYTi3jaBpPd9No6WDH99lxe57eIU7bo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-682-ei_pE99WOAaiFxZQ7aT3wQ-1; Mon,
 02 Jun 2025 03:49:10 -0400
X-MC-Unique: ei_pE99WOAaiFxZQ7aT3wQ-1
X-Mimecast-MFC-AGG-ID: ei_pE99WOAaiFxZQ7aT3wQ_1748850549
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 13246195608B; Mon,  2 Jun 2025 07:49:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.38])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A4D4919560B7; Mon,  2 Jun 2025 07:49:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E6D1E21E66C3; Mon, 02 Jun 2025 09:49:05 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-rust@nongnu.org
Subject: Re: [PATCH v2 00/14] rust: bindings for Error
In-Reply-To: <20250530080307.2055502-1-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Fri, 30 May 2025 10:02:52 +0200")
References: <20250530080307.2055502-1-pbonzini@redhat.com>
Date: Mon, 02 Jun 2025 09:49:05 +0200
Message-ID: <87y0uamvm6.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.071,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-List-Received-Date: Mon, 02 Jun 2025 07:49:17 -0000

Paolo Bonzini <pbonzini@redhat.com> writes:

> As explained for v1, the impetus for this series is to remove BqlCell<>
> from HPETState::num_timers.  However, it's also an important step for QAPI:
> error propagation is pretty central for example to QMP, and the series
> is also a first example of two-way conversion between C and native-Rust
> structs (i.e. not using bindgen-generated structs or their opaque wrappers).
>
> As an aside, support for NUL-terminated file is now scheduled for
> inclusion in Rust as "panic::Location::file_with_nul()", but it will be
> quite a while before QEMU can use it.  For more information, see
> https://github.com/rust-lang/rust/issues/141727.

Doen't apply for me on current master (3e82ddaa8db).  What's your base?


